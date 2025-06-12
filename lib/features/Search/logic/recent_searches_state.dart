import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Search/data/model/location_model.dart';

part 'recent_searches_state.freezed.dart';

@Freezed(toStringOverride: false)
class RecentSearchesState with _$RecentSearchesState {
  const factory RecentSearchesState({
    @Default(false) bool isLoading,
    @Default(false) bool isInitialized, // ✅ إضافة لتتبع التهيئة
    @Default([]) List<LocationModel> allLocations,
    @Default([]) List<LocationModel> recentSearches,
    @Default([]) List<LocationModel> searchResults,
    LocationModel? selectedLocation,
  }) = _RecentSearchesState;
}
