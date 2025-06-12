import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/features/Search/data/model/location_model.dart';
import 'package:system_pro/features/Search/logic/recent_searches_state.dart';
import 'package:system_pro/gen/assets.gen.dart';

class RecentSearchesCubit extends Cubit<RecentSearchesState> {
  RecentSearchesCubit() : super(const RecentSearchesState());

  Timer? _searchDebounce;

  Future<void> initialize() async {
    if (state.isInitialized) return;

    emit(state.copyWith(isLoading: true));
    try {
      final locations = await _loadLocations();
      final recent = await _loadRecentSearches();

      emit(
        state.copyWith(
          allLocations: locations,
          recentSearches: recent,
          isLoading: false,
          isInitialized: true,
        ),
      );
    } catch (e) {
      AppLogs.log('Init error: $e', type: LogType.error);
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<List<LocationModel>> _loadLocations() async {
    final jsonString = await rootBundle.loadString(Assets.location.locations);
    return compute(_parseLocationsInIsolate, jsonString);
  }

  static List<LocationModel> _parseLocationsInIsolate(String jsonString) {
    final List<dynamic> data = json.decode(jsonString);

    return data.expand((region) {
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
  }

  Future<List<LocationModel>> _loadRecentSearches() async {
    try {
      final data = CachingHelper.getListString(
        SharedPrefKeys.recentSearchesKey,
      );
      return data.map((e) => LocationModel.fromJson(json.decode(e))).toList();
    } catch (e) {
      AppLogs.log('Recent search load error: $e', type: LogType.error);
      return [];
    }
  }

  void onSearchQueryChanged(String query, {required bool isArabic}) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      if (query.trim().isEmpty) {
        emit(state.copyWith(searchResults: []));
        return;
      }

      final results =
          state.allLocations.where((location) {
            final fields =
                isArabic
                    ? [location.districtAr, location.cityAr, location.regionAr]
                    : [location.districtEn, location.cityEn, location.regionEn];
            return fields.any(
              (f) => f?.toLowerCase().contains(query.toLowerCase()) ?? false,
            );
          }).toList();

      emit(state.copyWith(searchResults: results));
    });
  }

  Future<void> selectLocation(LocationModel location) async {
    final updated = [...state.recentSearches];
    updated.removeWhere((e) => e == location);
    updated.insert(0, location);

   await CachingHelper.setData(
      SharedPrefKeys.recentSearchesKey,
      updated.length > 1
          ? ['... ${updated.length} items'] // 👈 لتقليل اللوج
          : updated.map((e) => json.encode(e.toJson())).toList(),
    );


    emit(state.copyWith(selectedLocation: location, recentSearches: updated));
  }

  Future<void> clearRecentSearches() async {
    await CachingHelper.removeData(SharedPrefKeys.recentSearchesKey);
    emit(state.copyWith(recentSearches: []));
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }
}
