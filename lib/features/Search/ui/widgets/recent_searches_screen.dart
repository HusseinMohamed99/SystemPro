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

class LocationModel {
  final String districtAr;
  final String districtEn;
  final String cityAr;
  final String cityEn;
  final String? regionAr;
  final String? regionEn;

  LocationModel({
    required this.districtAr,
    required this.districtEn,
    required this.cityAr,
    required this.cityEn,
    this.regionAr,
    this.regionEn,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    districtAr: json['district_ar'] ?? '',
    districtEn: json['district_en'] ?? '',
    cityAr: json['city_ar'] ?? '',
    cityEn: json['city_en'] ?? '',
    regionAr: json['region_ar'],
    regionEn: json['region_en'],
  );

  Map<String, dynamic> toJson() => {
    'district_ar': districtAr,
    'district_en': districtEn,
    'city_ar': cityAr,
    'city_en': cityEn,
    if (regionAr != null) 'region_ar': regionAr,
    if (regionEn != null) 'region_en': regionEn,
  };
}

class RecentSearchesScreen extends StatefulWidget {
  const RecentSearchesScreen({super.key});

  @override
  State<RecentSearchesScreen> createState() => _RecentSearchesScreenState();
}

class _RecentSearchesScreenState extends State<RecentSearchesScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<LocationModel> _recentSearches = [];
  List<LocationModel> _searchResults = [];
  List<LocationModel> _locations = [];
  LocationModel? _selectedLocation;
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
            return (region['cities'] as List).expand<LocationModel>((city) {
              return (city['districts'] as List).map<LocationModel>((district) {
                return LocationModel(
                  districtAr: district['name_ar'],
                  districtEn: district['name_en'],
                  cityAr: city['name_ar'],
                  cityEn: city['name_en'],
                  regionAr: region['name_ar'],
                  regionEn: region['name_en'],
                );
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
          data.map((e) => LocationModel.fromJson(json.decode(e))).toList();
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

  bool _isArabicText(String text) => RegExp(r'[\u0600-\u06FF]').hasMatch(text);

  void _handleSearch(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isEmpty) return setState(() => _searchResults.clear());

      final isArabic = _isArabicText(query);
      final results =
          _locations.where((location) {
            final fields =
                isArabic
                    ? [location.districtAr, location.cityAr, location.regionAr]
                    : [location.districtEn, location.cityEn, location.regionEn];
            return fields.any(
              (f) => f?.toLowerCase().contains(query.toLowerCase()) ?? false,
            );
          }).toList();

      setState(() => _searchResults = results);
    });
  }

  Future<void> _handleLocationSelect(LocationModel location) async {
    _recentSearches.removeWhere(
      (item) => json.encode(item.toJson()) == json.encode(location.toJson()),
    );
    _recentSearches.insert(0, location);
    _selectedLocation = location;

    await CachingHelper.setData(
      SharedPrefKeys.recentSearchesKey,
      _recentSearches.map((e) => json.encode(e.toJson())).toList(),
    );

    if (mounted) {
      setState(() {
        _searchController.text =
            context.isAr
                ? '${location.districtAr}، ${location.cityAr}'
                : '${location.districtEn}, ${location.cityEn}';
      });
    }
  }

  Widget _buildSearchTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.softGrey,
          darkColor: ColorManager.iconGrey,
        ),
      ),
      title: Text(
        title,
        style: context.titleMedium?.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
      ),
      subtitle:
          subtitle != null ? Text(subtitle, style: context.titleSmall) : null,
      onTap: onTap,
      onLongPress:
          subtitle != null
              ? () {
                Clipboard.setData(ClipboardData(text: '$title, $subtitle'));
                context.showSnackBar(
                  context.isAr ? 'تم النسخ' : 'Copied to clipboard',
                );
              }
              : null,
    );
  }

  Widget _buildSearchHeader() => Row(
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

  Widget _buildLocationsList() {
    if (_isLoading) return const Center(child: CircularProgressIndicator());

    final isSearching = _searchController.text.isNotEmpty;
    final locations = isSearching ? _searchResults : _recentSearches;
    final isArabic = context.isAr;
    final query = _searchController.text.trim();

    if (locations.isEmpty && !isSearching) return const SizedBox.shrink();

    final itemCount = locations.length + (isSearching ? 0 : 1);

    return Expanded(
      child: ListView.builder(
        itemCount: itemCount == 0 ? 1 : itemCount,
        itemBuilder: (context, index) {
          if (locations.isEmpty && isSearching) {
            return _buildSearchTile(
              icon: Icons.add_location_alt_outlined,
              title:
                  isArabic
                      ? 'إضافة "$query" كموقع مخصص'
                      : 'Add "$query" as custom location',
              onTap: () {
                final customLocation = LocationModel(
                  districtAr: query,
                  districtEn: query,
                  cityAr: isArabic ? 'موقع مخصص' : 'Custom location',
                  cityEn: 'Custom location',
                );
                _handleLocationSelect(customLocation);
              },
            );
          }

          if (!isSearching && index == locations.length) {
            return _buildSearchTile(
              icon: Icons.delete_outline,
              title: isArabic ? 'مسح عمليات البحث' : 'Clear recent searches',
              onTap: () async {
                context.showSnackBar(
                  isArabic ? 'تم مسح سجل البحث' : 'Recent searches cleared',
                );
                setState(_recentSearches.clear);
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
            child: _buildSearchTile(
              icon: isSearching ? Icons.place : Icons.history,
              title: isArabic ? location.districtAr : location.districtEn,
              subtitle: isArabic ? location.cityAr : location.cityEn,
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
                          ? _selectedLocation!.districtAr
                          : _selectedLocation!.districtEn,
                  city:
                      context.isAr
                          ? _selectedLocation!.cityAr
                          : _selectedLocation!.cityEn,
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
