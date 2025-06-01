// Marketplace Cubit - Manages real estate listings state and operations
// Handles:
// - Fetching and paginating listings
// - Filtering and sorting
// - Favorite management
// - Caching and state management

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketplace_response.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

/// Manages all marketplace-related state and business logic
/// Handles listing operations including:
/// - Fetching and pagination
/// - Filtering and sorting
/// - Favorite management
/// - Caching for performance optimization
class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;

  // Currently displayed listings
  final List<Listing> _visibleListings = [];

  // Cache for listings grouped by filter type
  final Map<String, List<Listing>> _cachedListingsByFilter = {};

  // Tracks last update time for each filter type
  final Map<String, DateTime> _lastUpdateCache = {};

  String _currentFilter = '';
  String get currentFilter => _currentFilter;

  // Pagination variables
  int _cursor = 0;
  int _limit = 5;
  String _direction = 'next';
  bool isLoading = false;
  bool hasMore = true;

  /// Resets pagination state to initial values
  void _resetPagination() {
    _visibleListings.clear();
    _cursor = 0;
    _limit = 5;
    _direction = 'next';
    isLoading = false;
    hasMore = true;
  }

  /// Fetches listings with optional filtering
  /// [filter]: Listing type filter (buy/rent)
  /// [forceRefresh]: Bypasses cache when true
  Future<void> getListings({String? filter, bool forceRefresh = false}) async {
    final effectiveFilter = filter?.isNotEmpty == true ? filter! : 'buy';

    // Return cached data if available and not forcing refresh
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

  /// Handles API response for listings
  Future<void> _handleResponse(ApiResult<MarketplaceResponse> result) async {
    result.when(
      success: (response) {
        final newItems = response.data?.listings ?? [];
        final latestUpdate = _getLatestUpdateTime(newItems);

        final previousUpdate = _lastUpdateCache[_currentFilter];
        final hasChanges = _hasChanges(latestUpdate, previousUpdate);

        // Return cached data if no changes detected
        if (!hasChanges) {
          _loadFromCache();
          return;
        }

        // Handle empty response
        if (newItems.isEmpty) {
          hasMore = false;
          _loadFromCache();
          return;
        }

        // Update cache with new data
        _updateCache(newItems, latestUpdate);
        _emitSuccessState();
      },
      failure: (error) {
        emit(MarketplaceState.error('Error: ${error.apiErrorModel.message}'));
      },
    );
  }

  /// Extracts the latest update time from listings
  DateTime? _getLatestUpdateTime(List<Listing> items) {
    return items
        .map((item) => DateTime.tryParse(item.updatedAt ?? ''))
        .whereType<DateTime>()
        .fold<DateTime?>(
          null,
          (prev, curr) => (prev == null || curr.isAfter(prev)) ? curr : prev,
        );
  }

  /// Determines if new changes exist since last update
  bool _hasChanges(DateTime? latestUpdate, DateTime? previousUpdate) {
    return latestUpdate == null ||
        previousUpdate == null ||
        latestUpdate.isAfter(previousUpdate);
  }

  /// Loads data from cache
  void _loadFromCache() {
    if (_cachedListingsByFilter.containsKey(_currentFilter)) {
      _visibleListings
        ..clear()
        ..addAll(_cachedListingsByFilter[_currentFilter]!);
    }
    _emitSuccessState();
  }

  /// Updates cache with new listings
  void _updateCache(List<Listing> newItems, DateTime? latestUpdate) {
    if (latestUpdate != null) {
      _lastUpdateCache[_currentFilter] = latestUpdate;
    }

    if (newItems.length < _limit) hasMore = false;

    _visibleListings.addAll(newItems);
    _cursor = _visibleListings.last.id ?? _cursor;

    _cachedListingsByFilter[_currentFilter] = List.from(_visibleListings);
  }

  /// Fetches listings from repository
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

  /// Loads more listings using current filter
  Future<void> loadMore() async => await _fetchListings(filter: _currentFilter);

  /// Emits success state with current listings
  void _emitSuccessState() {
    emit(
      MarketplaceState.success(
        listings: List.from(_visibleListings),
        selectedFilter: _currentFilter,
      ),
    );
  }

  /// Toggles favorite status for a listing
  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      result.when(
        success: (res) {
          _updateFavoriteStatus(id, res.data?.isFavorited ?? false, listing);
          _syncWithFavoriteCubit(id, res.data?.isFavorited ?? false, listing);
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

  /// Updates favorite status in local listings
  void _updateFavoriteStatus(int id, bool isFav, Listing? listing) {
    final index = _visibleListings.indexWhere((l) => l.id == id);
    if (index != -1) {
      _visibleListings[index] = _visibleListings[index].copyWith(
        isFavorite: isFav,
      );
    }
    _emitSuccessState();
  }

  /// Synchronizes favorite state with FavoriteCubit
  void _syncWithFavoriteCubit(int id, bool isFav, Listing? listing) {
    final favoriteCubit = getIt<FavoriteCubit>();
    if (isFav && listing != null) {
      favoriteCubit.addToFavorites(listing.copyWith(isFavorite: true));
    } else {
      favoriteCubit.removeFromFavorites(id);
    }
  }

  /// Sorts listings based on criteria
  void sortListings({
    required String newest,
    required String priceLow,
    required String priceHigh,
    required String sortType,
  }) {
    if (_visibleListings.isEmpty) return;

    if (sortType == newest) {
      _sortByNewest();
    } else {
      _sortByPrice(sortType == priceLow);
    }

    _emitSuccessState();
  }

  /// Sorts listings by creation date (newest first)
  void _sortByNewest() {
    _visibleListings.sort((a, b) {
      final aTime = DateTime.tryParse(a.createdAt ?? '') ?? DateTime(0);
      final bTime = DateTime.tryParse(b.createdAt ?? '') ?? DateTime(0);
      return bTime.compareTo(aTime);
    });
  }

  /// Sorts listings by price (ascending or descending)
  void _sortByPrice(bool ascending) {
    _visibleListings.sort((a, b) {
      final aPrice = double.tryParse(a.price ?? '0') ?? 0;
      final bPrice = double.tryParse(b.price ?? '0') ?? 0;
      return ascending ? aPrice.compareTo(bPrice) : bPrice.compareTo(aPrice);
    });
  }

  /// Fetches and filters listings based on search arguments
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

  /// Loads more listings with applied filters
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

      await _handleFilteredResponse(result, cacheKey, forceRefresh);
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    } finally {
      isLoading = false;
    }
  }

  /// Handles filtered listings API response
  Future<void> _handleFilteredResponse(
    ApiResult<MarketplaceResponse> result,
    String cacheKey,
    bool forceRefresh,
  ) async {
    result.when(
      success: (response) {
        final newItems = response.data?.listings ?? [];
        final latestUpdate = _getLatestUpdateTime(newItems);
        final lastCachedUpdate = _lastUpdateCache[cacheKey];

        final hasChanges = _hasChanges(latestUpdate, lastCachedUpdate);

        if (!hasChanges && !forceRefresh) {
          isLoading = false;
          return;
        }

        _processFilteredItems(newItems, cacheKey, latestUpdate);
      },
      failure: (error) {
        emit(MarketplaceState.error('Error: ${error.apiErrorModel.message}'));
      },
    );
  }

  /// Processes and caches filtered listings
  void _processFilteredItems(
    List<Listing> newItems,
    String cacheKey,
    DateTime? latestUpdate,
  ) {
    if (newItems.isEmpty || newItems.length < _limit) {
      hasMore = false;
    }

    _lastUpdateCache[cacheKey] = latestUpdate ?? DateTime.now();
    _visibleListings.addAll(newItems);
    _cursor = _visibleListings.last.id ?? _cursor;
    _cachedListingsByFilter[cacheKey] = List.from(_visibleListings);
    _emitSuccessState();
  }

  /// Filters currently loaded listings by type
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
