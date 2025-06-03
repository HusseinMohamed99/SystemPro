import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';

part 'real_estate_state.freezed.dart';

@freezed
class RealEstateState with _$RealEstateState {
  const factory RealEstateState.initial() = _Initial;

  /// State while first loading
  const factory RealEstateState.loading() = FilteredListingsLoading;

  /// State for successful data after filtering
  const factory RealEstateState.filtered(List<Listing> filteredListings) =
      FilteredListingsSuccess;

  /// State for loading next page (while keeping previous data)
  const factory RealEstateState.loadingMore(List<Listing> currentListings) =
      FilteredListingsLoadingMore;

  /// State for error
  const factory RealEstateState.error(String error) = FilteredListingsError;
}
