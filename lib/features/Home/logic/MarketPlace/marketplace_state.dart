import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';

part 'marketplace_state.freezed.dart';

@freezed
class MarketplaceState with _$MarketplaceState {
  /// Initial state before any action has been performed.
  const factory MarketplaceState.initial() = MarketPlaceInitial;

  /// Loading state during API fetch or refresh.
  const factory MarketplaceState.loading() = MarketPlaceLoading;

  /// State representing successful data load.
  const factory MarketplaceState.success({
    required List<Listing> listings,
    required String selectedFilter,
    required SortType selectedSort,
  }) = MarketPlaceSuccess;

  /// State representing an error during data load.
  const factory MarketplaceState.error(String error) = MarketPlaceError;
}
