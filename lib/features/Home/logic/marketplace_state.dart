import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';

part 'marketplace_state.freezed.dart';

@freezed
class MarketplaceState with _$MarketplaceState {
  const factory MarketplaceState.initial() = MarketPlaceInitial;
  const factory MarketplaceState.loading() = MarketPlaceLoading;
  const factory MarketplaceState.success({
    required List<Listing> listings,
    required String selectedFilter,
  }) = MarketPlaceSuccess;

  const factory MarketplaceState.error(String error) = MarketPlaceError;
}
