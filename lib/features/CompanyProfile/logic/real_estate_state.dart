import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';

part 'real_estate_state.freezed.dart';

@freezed
class RealEstateState with _$RealEstateState {
  const factory RealEstateState.initial() = _Initial;
  const factory RealEstateState.loading() = FilteredListingsLoading;
  const factory RealEstateState.filtered(List<Listing> filteredListings) =
      FilteredListingsSuccess;

  const factory RealEstateState.error(String error) = FilteredListingsError;
}
