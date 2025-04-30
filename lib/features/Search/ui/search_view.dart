import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/searchBars/custom_search_text_field.dart';
import 'package:system_pro/gen/assets.gen.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: const Column(
        children: [Expanded(child: RecentSearchesScreen())],
      ).allPadding(
        vPadding: kPaddingDefaultVertical,
        hPadding: kPaddingDefaultHorizontal,
      ),
    );
  }
}

class RecentSearchesScreen extends StatefulWidget {
  const RecentSearchesScreen({super.key});

  @override
  State<RecentSearchesScreen> createState() => _RecentSearchesScreenState();
}

class _RecentSearchesScreenState extends State<RecentSearchesScreen> {
  final TextEditingController _controller = TextEditingController();

  List<Map<String, String>> _recentSearches = [];
  List<Map<String, String>> _searchResults = [];
  List<Map<String, String>> _allDistricts = [];

  Map<String, String>? _selectedLocation; // ✅ لحفظ الاختيار الحالي

  static const String recentSearchesKey = 'recent_searches';

  @override
  void initState() {
    super.initState();
    _loadLocationData();
    _loadRecentSearches();
  }

  Future<void> _loadLocationData() async {
    final jsonString = await rootBundle.loadString(Assets.location.locations);
    final List data = json.decode(jsonString);

    final List<Map<String, String>> extracted = [];

    for (var region in data) {
      for (var city in region['cities']) {
        for (var district in city['districts']) {
          extracted.add({
            'district': district['name_en'],
            'city': city['name_en'],
          });
        }
      }
    }

    setState(() {
      _allDistricts = extracted;
    });
  }

  Future<void> _loadRecentSearches() async {
    final data = await CachingHelper.getListString(
      SharedPrefKeys.recentSearchesKey,
    );
    setState(() {
      _recentSearches =
          data.map((e) {
            final decoded = Map<String, dynamic>.from(json.decode(e));
            return {
              'district': decoded['district'] as String,
              'city': decoded['city'] as String,
            };
          }).toList();
    });
  }

  void _onSearch(String query) {
    final results =
        _allDistricts.where((item) {
          final district = item['district']!.toLowerCase();
          final city = item['city']!.toLowerCase();
          return district.contains(query.toLowerCase()) ||
              city.contains(query.toLowerCase());
        }).toList();

    setState(() {
      _searchResults = results;
    });
  }

Future<void> _onSelect(Map<String, String> selected) async {
    _recentSearches.removeWhere(
      (item) =>
          item['district'] == selected['district'] &&
          item['city'] == selected['city'],
    );

    _recentSearches.insert(0, selected);
    _selectedLocation = selected;

    final stringified = _recentSearches.map((e) => json.encode(e)).toList();
    await CachingHelper.setData(recentSearchesKey, stringified);

    setState(() {
      _controller.text =
          '${selected['district']}, ${selected['city']}'; // ✅ عرض العنوان
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isSearching = _controller.text.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 24.sp,
                color: ColorManager.softGray,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: CustomSearchTextField(
                readOnly: false,
                controller: _controller,
                onChanged: _onSearch,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          isSearching ? 'Results' : 'Recent Searches',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView.builder(
            itemCount:
                isSearching ? _searchResults.length : _recentSearches.length,
            itemBuilder: (context, index) {
              final item =
                  isSearching ? _searchResults[index] : _recentSearches[index];
              return ListTile(
                leading: Icon(
                  isSearching ? Icons.place : Icons.history,
                  size: 20,
                ),
                title: Text(item['district'] ?? ''),
                subtitle: Text(item['city'] ?? ''),
                onTap: () => _onSelect(item),
              );
            },
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (_selectedLocation != null) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder:
                //         (context) => FilterScreen(
                //           district: _selectedLocation!['district']!,
                //           city: _selectedLocation!['city']!,
                //         ),
                //   ),
                // );
                AppLogs.infoLog(
                  'district: ${_selectedLocation!['district']!} && city: ${_selectedLocation!['city']!}',
                );
              } else {
                // عرض رسالة تنبيه
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select a location first'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7366FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Done'),
          ),
        ),
      ],
    );
  }
}
