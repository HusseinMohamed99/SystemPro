import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';

part 'marketplace_state.freezed.dart';

@freezed
class MarketplaceState with _$MarketplaceState {
  const factory MarketplaceState.initial() = _Initial;
  const factory MarketplaceState.loading() = _Loading;
  const factory MarketplaceState.success(List<Listing> listings) = _Success;


  const factory MarketplaceState.error(String error) = _Error;
}
