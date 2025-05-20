import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = FavoriteInitial;

  const factory FavoriteState.getFavoriteLoading() = GetFavoriteLoading;

  /// تم تحميل أو تحديث قائمة المفضلات بنجاح
  const factory FavoriteState.getFavoriteSuccess({
    required List<Listing> listings,
    @Default(true) bool hasMore,
    @Default(false) bool isFromCache,
  }) = GetFavoriteSuccess;

  /// فشل تحميل أو تحديث المفضلات
  const factory FavoriteState.getFavoriteError(String error) = GetFavoriteError;
}
