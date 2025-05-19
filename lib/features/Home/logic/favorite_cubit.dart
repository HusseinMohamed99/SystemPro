import 'package:bloc/bloc.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/repos/favorite_repo.dart';
import 'package:system_pro/features/Home/logic/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this._favoriteRepo) : super(const FavoriteState.initial());

  final FavoriteRepo _favoriteRepo;

  final List<Listing> _favoriteListings = [];
  final List<Listing> _visibleFavorites = [];
  int _loadedCount = 0;
  final int _pageSize = 5;
  bool isLoading = false;

  bool get hasMore => _loadedCount < _favoriteListings.length;

  Future<void> getFavoriteListings() async {
    if (isLoading) return;
    isLoading = true;
    emit(const FavoriteState.getFavoriteLoading());

    try {
      final result = await _favoriteRepo.getFavoriteListings();
      result.when(
        success: (response) {
          final favorites = response.data ?? [];
          _favoriteListings
            ..clear()
            ..addAll(favorites);

          _visibleFavorites
            ..clear()
            ..addAll(favorites.take(_pageSize));
          _loadedCount = _visibleFavorites.length;

          emit(FavoriteState.getFavoriteSuccess(List.from(_visibleFavorites)));
        },
        failure: (errorHandler) {
          emit(
            FavoriteState.getFavoriteError(
              'فشل في جلب المفضلات: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      emit(FavoriteState.getFavoriteError('حدث خطأ غير متوقع: $error'));
    } finally {
      isLoading = false;
    }
  }

  Future<void> loadMore() async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    try {
      final nextItems =
          _favoriteListings.skip(_loadedCount).take(_pageSize).toList();
      _visibleFavorites.addAll(nextItems);
      _loadedCount = _visibleFavorites.length;
      emit(FavoriteState.getFavoriteSuccess(List.from(_visibleFavorites)));
    } finally {
      isLoading = false;
    }
  }

  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _favoriteRepo.toggleFavorite(id);

      result.when(
        success: (response) {
          if (response.status == 'success') {
            final isFavorited = response.data?.isFavorited ?? false;

            if (isFavorited) {
              final alreadyExists = _favoriteListings.any(
                (item) => item.id == id,
              );

              if (!alreadyExists) {
                if (listing != null) {
                  _favoriteListings.add(listing);
                  _visibleFavorites.insert(0, listing);
                  _loadedCount = _visibleFavorites.length;
                  emit(
                    FavoriteState.getFavoriteSuccess(
                      List.from(_visibleFavorites),
                    ),
                  );
                } else {
                  getFavoriteListings(); // fallback
                }
              }
            } else {
              // ✅ حذف من القوائم معًا مباشرة
              _favoriteListings.removeWhere((e) => e.id == id);
              _visibleFavorites.removeWhere((e) => e.id == id);
              _loadedCount = _visibleFavorites.length;
              emit(
                FavoriteState.getFavoriteSuccess(List.from(_visibleFavorites)),
              );
            }
          } else {
            emit(const FavoriteState.getFavoriteError('فشل في تبديل المفضلة'));
          }
        },
        failure: (errorHandler) {
          emit(
            FavoriteState.getFavoriteError(
              'فشل في التبديل: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      emit(FavoriteState.getFavoriteError('حدث خطأ غير متوقع: $error'));
    }
  }
}
