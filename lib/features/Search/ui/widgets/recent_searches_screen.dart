import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/searchBars/custom_search_text_field.dart';
import 'package:system_pro/features/Search/data/model/location_argument.dart';
import 'package:system_pro/gen/assets.gen.dart';

class RecentSearchesScreen extends StatefulWidget {
  const RecentSearchesScreen({super.key});

  @override
  State<RecentSearchesScreen> createState() => _RecentSearchesScreenState();
}

class _RecentSearchesScreenState extends State<RecentSearchesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _recentSearches = [];
  List<Map<String, String>> _searchResults = [];
  List<Map<String, String>> _locations = [];
  Map<String, String>? _selectedLocation;
  bool _isLoading = false;
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    setState(() => _isLoading = true);
    await Future.wait([_loadLocations(), _loadRecentSearches()]);
    setState(() => _isLoading = false);
  }

  Future<void> _loadLocations() async {
    try {
      final jsonString = await rootBundle.loadString(Assets.location.locations);
      final List<dynamic> data = json.decode(jsonString);

      _locations =
          data.expand((region) {
            final regionNameAr = region['name_ar'] as String;
            final regionNameEn = region['name_en'] as String;

            return (region['cities'] as List).expand<Map<String, String>>((
              city,
            ) {
              final cityNameAr = city['name_ar'] as String;
              final cityNameEn = city['name_en'] as String;

              return (city['districts'] as List).map<Map<String, String>>((
                district,
              ) {
                return {
                  'district_ar': district['name_ar'] as String,
                  'district_en': district['name_en'] as String,
                  'city_ar': cityNameAr,
                  'city_en': cityNameEn,
                  'region_ar': regionNameAr,
                  'region_en': regionNameEn,
                };
              });
            });
          }).toList();

      if (mounted) setState(() {});
    } catch (e) {
      AppLogs.log('Error loading locations: $e', type: LogType.error);
      rethrow;
    }
  }

  Future<void> _loadRecentSearches() async {
    try {
      final data = CachingHelper.getListString(
        SharedPrefKeys.recentSearchesKey,
      );
      final searches =
          data.map((e) {
            final decoded = json.decode(e) as Map<String, dynamic>;
            return {
              'district_en': decoded['district_en'] as String,
              'district_ar': decoded['district_ar'] as String,
              'city_en': decoded['city_en'] as String,
              'city_ar': decoded['city_ar'] as String,
            };
          }).toList();

      if (mounted) {
        setState(() {
          _recentSearches.clear();
          _recentSearches.addAll(searches);
        });
      }
    } catch (e) {
      AppLogs.log('Error loading recent searches: $e', type: LogType.error);
    }
  }

  bool _isArabicText(String text) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    return arabicRegex.hasMatch(text);
  }

  void _handleSearch(String query) {
    if (_searchDebounce?.isActive ?? false) _searchDebounce?.cancel();

    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isEmpty) {
        setState(_searchResults.clear);
        return;
      }

      final isArabic = _isArabicText(query);
      final results =
          _locations.where((location) {
            if (isArabic) {
              return (location['district_ar']?.contains(query) ?? false) ||
                  (location['city_ar']?.contains(query) ?? false) ||
                  (location['region_ar']?.contains(query) ?? false);
            } else {
              final q = query.toLowerCase();
              return (location['district_en']?.toLowerCase().contains(q) ??
                      false) ||
                  (location['city_en']?.toLowerCase().contains(q) ?? false) ||
                  (location['region_en']?.toLowerCase().contains(q) ?? false);
            }
          }).toList();

      setState(() => _searchResults = results);
    });
  }

  Future<void> _handleLocationSelect(Map<String, String> location) async {
    _recentSearches.removeWhere(
      (item) =>
          item['district_en'] == location['district_en'] &&
          item['district_ar'] == location['district_ar'] &&
          item['city_en'] == location['city_en'] &&
          item['city_ar'] == location['city_ar'],
    );

    _recentSearches.insert(0, location);
    _selectedLocation = location;

    await CachingHelper.setData(
      SharedPrefKeys.recentSearchesKey,
      _recentSearches.map((e) => json.encode(e)).toList(),
    );

    if (mounted) {
      setState(() {
        _searchController.text =
            context.isAr
                ? '${location['district_ar']}، ${location['city_ar']}'
                : '${location['district_en']}, ${location['city_en']}';
      });
    }
  }

  Widget _buildSearchHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: context.pop,
          child: Icon(
            Icons.close,
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGrey,
              darkColor: ColorManager.iconGrey,
            ),
          ),
        ),
        horizontalSpacing(kSpacingSmall),
        Expanded(
          child: CustomSearchTextField(
            readOnly: false,
            controller: _searchController,
            onChanged: _handleSearch,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationsList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final isSearching = _searchController.text.isNotEmpty;
    final locations = isSearching ? _searchResults : _recentSearches;
    final isArabic = context.isAr;
    final query = _searchController.text.trim();

    if (locations.isEmpty && !isSearching) return const SizedBox.shrink();

    final itemCount =
        locations.isEmpty && isSearching
            ? 1
            : locations.length + (isSearching ? 0 : 1);

    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (locations.isEmpty && isSearching) {
            return ListTile(
              leading: const Icon(Icons.add_location_alt_outlined),
              title: Text(
                isArabic
                    ? 'إضافة "$query" كموقع مخصص'
                    : 'Add "$query" as custom location',
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              onTap: () {
                final customLocation = {
                  'district_ar': query,
                  'district_en': query,
                  'city_ar': isArabic ? 'موقع مخصص' : 'Custom location',
                  'city_en': 'Custom location',
                };
                _handleLocationSelect(customLocation);
              },
            );
          }

          if (!isSearching && index == locations.length) {
            return ListTile(
              leading: const Icon(Icons.delete_outline),
              title: Text(
                isArabic ? 'مسح عمليات البحث' : 'Clear recent searches',
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              onTap: () async {
                context.showSnackBar(
                  isArabic ? 'تم مسح سجل البحث' : 'Recent searches cleared',
                );
                if (mounted) setState(_recentSearches.clear);
                await CachingHelper.removeData(
                  SharedPrefKeys.recentSearchesKey,
                );
              },
            );
          }

          final location = locations[index];
          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero),
            builder:
                (_, offset, child) =>
                    Transform.translate(offset: offset, child: child!),
            child: ListTile(
              onLongPress: () {
                Clipboard.setData(
                  ClipboardData(
                    text:
                        isArabic
                            ? '${location['district_ar']}، ${location['city_ar']}'
                            : '${location['district_en']}, ${location['city_en']}',
                  ),
                );
                context.showSnackBar(
                  isArabic ? 'تم النسخ' : 'Copied to clipboard',
                );
              },
              leading: Icon(
                isSearching ? Icons.place : Icons.history,
                color: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.softGrey,
                  darkColor: ColorManager.iconGrey,
                ),
              ),
              title: Text(
                isArabic
                    ? location['district_ar'] ?? ''
                    : location['district_en'] ?? '',
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              subtitle: Text(
                isArabic
                    ? location['city_ar'] ?? ''
                    : location['city_en'] ?? '',
                style: context.titleSmall,
              ),
              onTap: () => _handleLocationSelect(location),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = _searchController.text.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchHeader(),
              verticalSpacing(kSpacingXLarge),
              Text(
                isSearching
                    ? context.localization.result
                    : context.localization.recent_search,
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              verticalSpacing(kSpacingSmall),
              _buildLocationsList(),
            ],
          ),
        ),
        CustomButton(
          text: context.localization.done,
          onPressed: () {
            if (_selectedLocation != null) {
              context.pushNamed(
                Routes.filterView,
                arguments: LocationArgument(
                  district:
                      context.isAr
                          ? _selectedLocation!['district_ar']!
                          : _selectedLocation!['district_en']!,
                  city:
                      context.isAr
                          ? _selectedLocation!['city_ar']!
                          : _selectedLocation!['city_en']!,
                ),
              );
            } else {
              context.showSnackBar(context.localization.select_location);
            }
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }
}
