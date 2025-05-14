import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';

part 'marketplace_state.freezed.dart';

@freezed
class MarketplaceState with _$MarketplaceState {
  const factory MarketplaceState.initial() = MarketPlaceInitial;
  const factory MarketplaceState.loading() = MarketPlaceLoading;
  const factory MarketplaceState.success(List<Listing> listings) =
      MarketPlaceSuccess;

  const factory MarketplaceState.error(String error) = MarketPlaceError;

  const factory MarketplaceState.getFavoriteLoading() = GetFavoriteLoading;
  const factory MarketplaceState.getFavoriteSuccess(List<Listing> listings) =
      GetFavoriteSuccess;

  const factory MarketplaceState.getFavoriteError(String error) =
      GetFavoriteError;

}
