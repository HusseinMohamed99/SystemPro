import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
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
                  'district': district['name_en'],
                  'city': city['name_en'],
                },
              );
            });
          }).toList();
      setState(() {});
    } catch (e) {
      AppLogs.errorLog('Error loading locations: $e');
    }
  }

  Future<void> _loadRecentSearches() async {
    try {
      final data = CachingHelper.getListString(
        SharedPrefKeys.recentSearchesKey,
      );
      final searches =
          data.map((e) {
            final Map<String, dynamic> decoded = json.decode(e);
            return {
              'district': decoded['district'] as String,
              'city': decoded['city'] as String,
            };
          }).toList();
      setState(() {
        _recentSearches.clear();
        _recentSearches.addAll(searches);
      });
    } catch (e) {
      AppLogs.errorLog('Error loading recent searches: $e');
    }
  }

  void _handleSearch(String query) {
    if (query.isEmpty) {
      setState(_searchResults.clear);
      return;
    }
    final lowercaseQuery = query.toLowerCase();
    final results =
        _locations.where((location) {
          final district = location['district']?.toLowerCase() ?? '';
          final city = location['city']?.toLowerCase() ?? '';
          return district.contains(lowercaseQuery) ||
              city.contains(lowercaseQuery);
        }).toList();
    setState(() {
      _searchResults.clear();
      _searchResults.addAll(results);
    });
  }

  Future<void> _handleLocationSelect(Map<String, String> location) async {
    _recentSearches.removeWhere(
      (item) =>
          item['district'] == location['district'] &&
          item['city'] == location['city'],
    );
    _recentSearches.insert(0, location);
    _selectedLocation = location;
    await CachingHelper.setData(
      SharedPrefKeys.recentSearchesKey,
      _recentSearches.map((e) => json.encode(e)).toList(),
    );
    setState(() {
      _searchController.text = '${location['district']}, ${location['city']}';
    });
  }

  Widget _buildSearchHeader() {
    return Row(
      children: [
        GestureDetector(
          onTap: context.pop,
          child: Icon(
            Icons.close,
            size: kIconSizeDefault.sp,
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGray,
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
    final bool isSearching = _searchController.text.isNotEmpty;
    final locations = isSearching ? _searchResults : _recentSearches;
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsetsDirectional.zero,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              isSearching ? Icons.place : Icons.history,
              size: kIconSizeDefault.sp,
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.softGray,
                darkColor: ColorManager.iconGrey,
              ),
            ),
            title: Text(
              location['district'] ?? '',
              style: context.titleMedium!.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
            subtitle: Text(location['city'] ?? '', style: context.titleSmall),
            onTap: () => _handleLocationSelect(location),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSearching = _searchController.text.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSearchHeader(),
        verticalSpacing(kSpacingXLarge),
        Text(
          isSearching
              ? context.localization.result
              : context.localization.recent_search,
          style: context.titleMedium!.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        verticalSpacing(kSpacingSmall),
        _buildLocationsList(),
        CustomButton(
          text: context.localization.done,
          onPressed: () {
            if (_selectedLocation != null) {
              context.pushNamed(
                Routes.filterView,
                arguments: LocationArgument(
                  district: _selectedLocation!['district']!,
                  city: _selectedLocation!['city']!,
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
