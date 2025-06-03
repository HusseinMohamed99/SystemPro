import 'package:bloc/bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/favorite_repo.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_state.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';

/// FavoriteCubit manages the state of favorite
/// listings including toggle, pagination and cache
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

  /// Load favorite listings either from cache or API
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

  /// Toggle favorite status and update internal cache accordingly
  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _favoriteRepo.toggleFavorite(id);

      result.when(
        success: (response) {
          final isFavorited = response.data?.isFavorited ?? false;
          final exists = _favoriteListings.any((e) => e.id == id);

          if (isFavorited) {
            if (!exists && listing != null) {
              final updated = listing.copyWith(isFavorite: true);
              _favoriteListings.insert(0, updated);
              _visibleFavorites.insert(0, updated);

              // ✅ Sync with MarketplaceCubit
              final marketplaceCubit = getIt<MarketplaceCubit>();
              marketplaceCubit.updateListingFavoriteStatus(updated.id!, true);
            }
          } else {
            _favoriteListings.removeWhere((e) => e.id == id);
            _visibleFavorites.removeWhere((e) => e.id == id);

            // ✅ Sync with MarketplaceCubit
            final marketplaceCubit = getIt<MarketplaceCubit>();
            marketplaceCubit.updateListingFavoriteStatus(id, false);
            marketplaceCubit.clearHydratedCache(); // مهم لمسح الكاش
          }

          _loadedCount = _visibleFavorites.length;
          _isCacheLoaded = true;

          emit(const FavoriteState.getFavoriteLoading()); // force UI update

          emit(
            FavoriteState.getFavoriteSuccess(
              listings: List.from(_visibleFavorites),
              hasMore: hasMore,
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

  /// Load more visible items from internal cache
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

  /// Manually refresh all favorites from server
  Future<void> refreshFavorites() async {
    await getFavoriteListings(forceRefresh: true);
  }

  /// Clear local cache, useful on logout
  void clearFavoriteCache() {
    _isCacheLoaded = false;
    _favoriteListings.clear();
    _visibleFavorites.clear();
    _loadedCount = 0;
  }

  /// External injection support: add to favorites manually
  void addToFavorites(Listing listing) {
    final exists = _favoriteListings.any((e) => e.id == listing.id);
    if (!exists) {
      final updated = listing.copyWith(isFavorite: true);
      _favoriteListings.insert(0, updated);
      _visibleFavorites.insert(0, updated);
      _loadedCount = _visibleFavorites.length;
      _isCacheLoaded = true;

      emit(const FavoriteState.getFavoriteLoading()); // ⬅️ refresh trigger

      emit(
        FavoriteState.getFavoriteSuccess(
          listings: List.from(_visibleFavorites),
          hasMore: hasMore,
        ),
      );
    }
  }

  /// External injection support: remove from favorites manually
  void removeFromFavorites(int id) {
    _favoriteListings.removeWhere((e) => e.id == id);
    _visibleFavorites.removeWhere((e) => e.id == id);
    _loadedCount = _visibleFavorites.length;

    emit(const FavoriteState.getFavoriteLoading()); // ⬅️ refresh trigger

    emit(
      FavoriteState.getFavoriteSuccess(
        listings: List.from(_visibleFavorites),
        hasMore: hasMore,
      ),
    );
  }
}
