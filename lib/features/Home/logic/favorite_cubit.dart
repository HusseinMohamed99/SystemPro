import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
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
  bool _isCacheLoaded = false;

  bool get isCacheLoaded => _isCacheLoaded;
  bool get hasMore => _loadedCount < _favoriteListings.length;

  /// 🔄 تحميل المفضلات (من الكاش أو API)
  Future<void> getFavoriteListings({bool forceRefresh = false}) async {
    if (isLoading) return;

    if (_isCacheLoaded && !forceRefresh) {
      emit(
        FavoriteState.getFavoriteSuccess(
          listings: List.from(_visibleFavorites),
          hasMore: hasMore,
          isFromCache: true,
        ),
      );
      return;
    }

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
          _isCacheLoaded = true;

          emit(
            FavoriteState.getFavoriteSuccess(
              listings: List.from(_visibleFavorites),
              hasMore: hasMore,
              isFromCache: false,
            ),
          );
        },
        failure: (error) {
          emit(
            FavoriteState.getFavoriteError(
              'فشل في جلب المفضلات: ${error.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (e) {
      emit(FavoriteState.getFavoriteError('حدث خطأ غير متوقع: $e'));
    } finally {
      isLoading = false;
    }
  }

  /// ❤️ تبديل المفضلة (تعمل Emit دائمًا)
  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _favoriteRepo.toggleFavorite(id);

      result.when(
        success: (response) {
          final isFavorited = response.data?.isFavorited ?? false;

          final exists = _favoriteListings.any((e) => e.id == id);

          if (isFavorited) {
            if (!exists && listing != null) {
              _favoriteListings.insert(0, listing);
              _visibleFavorites.insert(0, listing);
            }
          } else {
            _favoriteListings.removeWhere((e) => e.id == id);
            _visibleFavorites.removeWhere((e) => e.id == id);
          }

          _loadedCount = _visibleFavorites.length;
          _isCacheLoaded = true;

          emit(const FavoriteState.getFavoriteLoading()); // لضمان التحديث

          emit(
            FavoriteState.getFavoriteSuccess(
              listings: List.from(_visibleFavorites),
              hasMore: hasMore,
              isFromCache: false,
            ),
          );
        },
        failure: (error) {
          emit(
            FavoriteState.getFavoriteError(
              'فشل في تبديل المفضلة: ${error.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (e) {
      emit(FavoriteState.getFavoriteError('حدث خطأ غير متوقع: $e'));
    }
  }

  /// 🔁 تحميل المزيد (Pagination)
  Future<void> loadMore() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    try {
      final nextItems =
          _favoriteListings.skip(_loadedCount).take(_pageSize).toList();

      _visibleFavorites.addAll(nextItems);
      _loadedCount = _visibleFavorites.length;

      emit(
        FavoriteState.getFavoriteSuccess(
          listings: List.from(_visibleFavorites),
          hasMore: hasMore,
          isFromCache: true,
        ),
      );
    } finally {
      isLoading = false;
    }
  }

  /// 🔄 تحديث يدوي (pull to refresh)
  Future<void> refreshFavorites() async {
    await getFavoriteListings(forceRefresh: true);
  }

  /// 🧹 مسح الكاش (مثلاً عند تسجيل الخروج)
  void clearFavoriteCache() {
    _isCacheLoaded = false;
    _favoriteListings.clear();
    _visibleFavorites.clear();
    _loadedCount = 0;
  }
}
