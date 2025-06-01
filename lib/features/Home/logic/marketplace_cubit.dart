import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketplace_response.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final List<Listing> _visibleListings = [];
  final Map<String, List<Listing>> _cachedListingsByFilter = {};
  final Map<String, DateTime> _lastUpdateCache = {};

  String _currentFilter = '';
  String get currentFilter => _currentFilter;

  int _cursor = 0;
  int _limit = 5;
  String _direction = 'next';
  bool isLoading = false;
  bool hasMore = true;

  void _resetPagination() {
    _visibleListings.clear();
    _cursor = 0;
    _limit = 5;
    _direction = 'next';
    isLoading = false;
    hasMore = true;
  }

  Future<void> getListings({String? filter, bool forceRefresh = false}) async {
    final effectiveFilter = filter?.isNotEmpty == true ? filter! : 'buy';

    if (!forceRefresh && _cachedListingsByFilter.containsKey(effectiveFilter)) {
      _currentFilter = effectiveFilter;

      _visibleListings
        ..clear()
        ..addAll(_cachedListingsByFilter[effectiveFilter]!);

      if (_visibleListings.isNotEmpty) {
        _cursor = _visibleListings.last.id ?? 0;
      }
      _emitSuccessState();
      return;
    }

    emit(const MarketplaceState.loading());
    _resetPagination();
    _currentFilter = effectiveFilter;
    await _fetchListings(filter: effectiveFilter);
  }

  Future<void> _handleResponse(ApiResult<MarketplaceResponse> result) async {
    result.when(
      success: (response) {
        final newItems = response.data?.listings ?? [];

        final latestUpdate = newItems
            .map((item) => DateTime.tryParse(item.updatedAt ?? ''))
            .whereType<DateTime>()
            .fold<DateTime?>(
              null,
              (prev, curr) =>
                  (prev == null || curr.isAfter(prev)) ? curr : prev,
            );

        final previousUpdate = _lastUpdateCache[_currentFilter];
        final hasChanges =
            latestUpdate == null ||
            previousUpdate == null ||
            latestUpdate.isAfter(previousUpdate);

        if (!hasChanges) {
          // حتى لو مفيش تغيير، إرجع الكاش إن وجد
          if (_cachedListingsByFilter.containsKey(_currentFilter)) {
            _visibleListings
              ..clear()
              ..addAll(_cachedListingsByFilter[_currentFilter]!);
          }
          _emitSuccessState();
          return;
        }

        if (newItems.isEmpty) {
          hasMore = false;
          if (_cachedListingsByFilter.containsKey(_currentFilter)) {
            _visibleListings
              ..clear()
              ..addAll(_cachedListingsByFilter[_currentFilter]!);
          }
          _emitSuccessState();
          return;
        }

        if (latestUpdate != null) {
          _lastUpdateCache[_currentFilter] = latestUpdate;
        }

        if (newItems.length < _limit) {
          hasMore = false;
        }

        _visibleListings.addAll(newItems);

        if (_visibleListings.isNotEmpty) {
          _cursor = _visibleListings.last.id ?? _cursor;
        }

        _cachedListingsByFilter[_currentFilter] = List.from(_visibleListings);
        _emitSuccessState();
      },
      failure: (error) {
        emit(MarketplaceState.error('Error: ${error.apiErrorModel.message}'));
      },
    );
  }

  Future<void> _fetchListings({String filter = ''}) async {
    if (isLoading || !hasMore) return;
    isLoading = true;

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        FilterRequestModel(
          direction: _direction,
          cursor: _cursor,
          limit: _limit,
          listingType: filter,
        ),
      );

      await _handleResponse(result);
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    } finally {
      isLoading = false;
    }
  }

  Future<void> loadMore() async {
    await _fetchListings(filter: _currentFilter);
  }

  void _emitSuccessState() {
    emit(
      MarketplaceState.success(
        listings: List.from(_visibleListings),
        selectedFilter: _currentFilter,
      ),
    );
  }

  Future<void> loadMoreWithArgs(
    FilterResultArguments args, {
    bool forceRefresh = false,
  }) async {
    if (isLoading || !hasMore) return;
    isLoading = true;

    final cacheKey = args.hashCode.toString();

    try {
      final request = FilterRequestModel.fromArgs(
        args,
      ).copyWith(direction: _direction, cursor: _cursor, limit: _limit);

      final result = await _marketplaceRepo.getMarketplaceListings(request);

      result.when(
        success: (response) {
          final newItems = response.data?.listings ?? [];

          if (newItems.isEmpty || newItems.length < _limit) {
            hasMore = false;
          }

          final latestUpdate = newItems
              .map((item) => DateTime.tryParse(item.updatedAt ?? ''))
              .whereType<DateTime>()
              .fold<DateTime?>(
                null,
                (prev, current) =>
                    (prev == null || current.isAfter(prev)) ? current : prev,
              );

          final lastCachedUpdate = _lastUpdateCache[cacheKey];

          final hasChanges =
              latestUpdate == null ||
              lastCachedUpdate == null ||
              latestUpdate.isAfter(lastCachedUpdate);

          if (!hasChanges && !forceRefresh) {
            isLoading = false;
            return;
          }

          _lastUpdateCache[cacheKey] = latestUpdate ?? DateTime.now();

          _visibleListings.addAll(newItems);
          _cursor = _visibleListings.last.id ?? _cursor;

          _cachedListingsByFilter[cacheKey] = List.from(_visibleListings);
          _emitSuccessState();
        },
        failure: (error) {
          emit(MarketplaceState.error('Error: ${error.apiErrorModel.message}'));
        },
      );
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    } finally {
      isLoading = false;
    }
  }

  Future<void> fetchAndFilterListings(FilterResultArguments args) async {
    emit(const MarketplaceState.loading());
    _resetPagination();

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        FilterRequestModel.fromArgs(
          args,
        ).copyWith(direction: _direction, cursor: _cursor, limit: _limit),
      );

      await _handleResponse(result);
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    }
  }

  void sortListings({
    required String newest,
    required String priceLow,
    required String priceHigh,
    required String sortType,
  }) {
    if (_visibleListings.isEmpty) return;

    if (sortType == newest) {
      _visibleListings.sort((a, b) {
        final aTime = DateTime.tryParse(a.createdAt ?? '') ?? DateTime(0);
        final bTime = DateTime.tryParse(b.createdAt ?? '') ?? DateTime(0);
        return bTime.compareTo(aTime);
      });
    } else {
      _visibleListings.sort((a, b) {
        final aPrice = double.tryParse(a.price ?? '0') ?? 0;
        final bPrice = double.tryParse(b.price ?? '0') ?? 0;
        return sortType == priceLow
            ? aPrice.compareTo(bPrice)
            : bPrice.compareTo(aPrice);
      });
    }

    _emitSuccessState();
  }

  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      result.when(
        success: (res) {
          final isFav = res.data?.isFavorited ?? false;

          final index = _visibleListings.indexWhere((l) => l.id == id);
          if (index != -1) {
            _visibleListings[index] = _visibleListings[index].copyWith(
              isFavorite: isFav,
            );
          }

          _emitSuccessState();

          final favoriteCubit = getIt<FavoriteCubit>();
          if (isFav && listing != null) {
            favoriteCubit.addToFavorites(listing.copyWith(isFavorite: true));
          } else {
            favoriteCubit.removeFromFavorites(id);
          }
        },
        failure: (err) {
          emit(
            MarketplaceState.error(
              'Favorite toggle failed: ${err.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    }
  }

  Future<void> filterListings(String filter) async {
    _currentFilter = filter;

    final filtered =
        _visibleListings
            .where((l) => l.listingType?.toLowerCase() == filter.toLowerCase())
            .toList();

    emit(
      MarketplaceState.success(
        listings: filtered,
        selectedFilter: _currentFilter,
      ),
    );
  }
}
