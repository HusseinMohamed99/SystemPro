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
  final List<Map<String, String>> _searchResults = [];
  List<Map<String, String>> _locations = [];
  Map<String, String>? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await Future.wait([_loadLocations(), _loadRecentSearches()]);
  }

  Future<void> _loadLocations() async {
    try {
      final jsonString = await rootBundle.loadString(Assets.location.locations);
      final List<dynamic> data = json.decode(jsonString);
      _locations =
          data.expand((region) {
            return (region['cities'] as List).expand<Map<String, String>>((
              city,
            ) {
              return (city['districts'] as List).map<Map<String, String>>(
                (district) => {
                  'district_en': district['name_en'],
                  'district_ar': district['name_ar'],
                  'city_en': city['name_en'],
                  'city_ar': city['name_ar'],
                },
              );
            });
          }).toList();
      if (mounted) setState(() {});
    } catch (e) {
      AppLogs.log('Error loading locations: $e', type: LogType.error);
    }
  }

  Future<void> _loadRecentSearches() async {
    try {
      final data = CachingHelper.getListString(
        SharedPrefKeys.recentSearchesKey,
      );
      final searches =
          data.map((e) {
            final decoded = json.decode(e);
            return {
              'district_en': decoded['district_en'],
              'district_ar': decoded['district_ar'],
              'city_en': decoded['city_en'],
              'city_ar': decoded['city_ar'],
            };
          }).toList();
      if (mounted) {
        setState(() {
          _recentSearches.clear();
          _recentSearches.addAll(searches as Iterable<Map<String, String>>);
        });
      }
    } catch (e) {
      AppLogs.log('Error loading recent searches: $e', type: LogType.error);
    }
  }

 void _handleSearch(String query) {
    if (query.isEmpty) {
      setState(() => _searchResults.clear());
      return;
    }

    final q = query.toLowerCase();

    // Detect input language, not UI language
    final isInputArabic = RegExp(r'[\u0600-\u06FF]').hasMatch(query);

    final results =
        _locations.where((location) {
          if (isInputArabic) {
            return (location['district_ar']?.contains(query) ?? false) ||
                (location['city_ar']?.contains(query) ?? false);
          } else {
            return (location['district_en']?.toLowerCase().contains(q) ??
                    false) ||
                (location['city_en']?.toLowerCase().contains(q) ?? false);
          }
        }).toList();

    setState(() {
      _searchResults
        ..clear()
        ..addAll(results);
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
            '${location['district_ar']}، ${location['city_ar']}';
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
                  'city_ar': '',
                  'city_en': '',
                };
                _handleLocationSelect(customLocation);
              },
            );
          }

         if (_searchResults.isEmpty && isSearching && query.isNotEmpty) {
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
                  'city_ar': '',
                  'city_en': '',
                };
                _handleLocationSelect(customLocation);
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
    _searchController.dispose();
    super.dispose();
  }
}
