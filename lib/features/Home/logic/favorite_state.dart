import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = FavoriteInitial;

  const factory FavoriteState.getFavoriteLoading() = GetFavoriteLoading;
  const factory FavoriteState.getFavoriteSuccess(List<Listing> listings) =
      GetFavoriteSuccess;

  const factory FavoriteState.getFavoriteError(String error) = GetFavoriteError;
}
