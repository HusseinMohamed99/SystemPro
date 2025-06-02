// Updated MarketplaceCubit with pagination, caching,
// sorting improvements, and better state management

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

/// Helper class to manage pagination state
class PaginationState {
  int cursor = 0;
  final int limit = 5;
  String direction = 'next';
  bool isLoading = false;
  bool hasMore = true;

  void reset() {
    cursor = 0;
    direction = 'next';
    isLoading = false;
    hasMore = true;
  }
}

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;
  final List<Listing> _visibleListings = [];
  final Map<String, List<Listing>> _cachedListingsByFilter = {};

  final PaginationState pagination = PaginationState();

  String _currentFilter = '';
  SortType _currentSort = SortType.newest;

  String get currentFilter => _currentFilter;

  /// Emit success state and apply current sort before emission
  void _emitSuccessState() {
    _sortListings(_currentSort);
    emit(
      MarketplaceState.success(
        listings: List.from(_visibleListings),
        selectedFilter: _currentFilter,
      ),
    );
  }

  /// Emit a standardized error state with message
  void _emitError(String message) {
    emit(MarketplaceState.error(message));
  }

  /// Fetch listings by basic type with optional force refresh
  Future<void> getListings({String? filter, bool forceRefresh = false}) async {
    final effectiveFilter = (filter?.isNotEmpty ?? false) ? filter! : 'buy';

    if (!forceRefresh && _cachedListingsByFilter.containsKey(effectiveFilter)) {
      _currentFilter = effectiveFilter;
      _visibleListings
        ..clear()
        ..addAll(_cachedListingsByFilter[effectiveFilter]!);

      if (_visibleListings.isNotEmpty) {
        pagination.cursor = _visibleListings.last.id ?? 0;
      }
      _emitSuccessState();
      return;
    }

    emit(const MarketplaceState.loading());
    pagination.reset();
    _visibleListings.clear();
    _currentFilter = effectiveFilter;

    await _fetchAndHandleListings(
      request: FilterRequestModel(
        direction: pagination.direction,
        cursor: pagination.cursor,
        limit: pagination.limit,
        listingType: effectiveFilter,
      ),
      cacheKey: effectiveFilter,
    );
  }

  /// Load the next page of listings for current filter
  Future<void> loadMore() async {
    await _fetchAndHandleListings(
      request: FilterRequestModel(
        direction: pagination.direction,
        cursor: pagination.cursor,
        limit: pagination.limit,
        listingType: _currentFilter,
      ),
      cacheKey: _currentFilter,
    );
  }

  /// Fetch listings using advanced filters from [FilterResultArguments]
  Future<void> fetchAndFilterListings(FilterResultArguments args) async {
    emit(const MarketplaceState.loading());
    pagination.reset();
    _visibleListings.clear();
    final key = args.hashCode.toString();

    await _fetchAndHandleListings(
      request: FilterRequestModel.fromArgs(args).copyWith(
        direction: pagination.direction,
        cursor: pagination.cursor,
        limit: pagination.limit,
      ),
      cacheKey: key,
    );
  }

  /// Load more listings with advanced filters
  Future<void> loadMoreWithArgs(FilterResultArguments args) async {
    final key = args.hashCode.toString();
    await _fetchAndHandleListings(
      request: FilterRequestModel.fromArgs(args).copyWith(
        direction: pagination.direction,
        cursor: pagination.cursor,
        limit: pagination.limit,
      ),
      cacheKey: key,
    );
  }

  /// Central handler to fetch data and update state
  Future<void> _fetchAndHandleListings({
    required FilterRequestModel request,
    required String cacheKey,
  }) async {
    if (pagination.isLoading || !pagination.hasMore) return;
    pagination.isLoading = true;

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(request);

      result.when(
        success: (response) {
          final newItems = response.data?.listings ?? [];

          if (newItems.isEmpty) {
            pagination.hasMore = false;
            _emitSuccessState();
            return;
          }

          if (newItems.length < pagination.limit) {
            pagination.hasMore = false;
          }

          _visibleListings.addAll(newItems);

          final lastId = newItems.last.id;
          if (lastId != null) {
            pagination.cursor = lastId;
          }

          if (pagination.cursor == pagination.limit || pagination.cursor == 0) {
            _cachedListingsByFilter[cacheKey] = List.from(_visibleListings);
          }

          _emitSuccessState();
        },
        failure: (error) {
          _emitError('Error: ${error.apiErrorModel.message}');
        },
      );
    } catch (e) {
      _emitError('Unexpected error: $e');
    } finally {
      pagination.isLoading = false;
    }
  }

  /// Toggle favorite status and update FavoriteCubit accordingly
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
          _emitError('Favorite toggle failed: ${err.apiErrorModel.message}');
        },
      );
    } catch (e) {
      _emitError('Unexpected error: $e');
    }
  }

  /// Apply sorting to listings list based on selected type
  void sortListings(SortType sortType, {bool shouldEmit = true}) {
    _currentSort = sortType;
    _sortListings(sortType);

    if (shouldEmit) {
      emit(
        MarketplaceState.success(
          listings: List.from(_visibleListings),
          selectedFilter: _currentFilter,
        ),
      );
    }
  }

  /// Internal helper to sort list (used also in emitSuccess)
  void _sortListings(SortType sortType) {
    if (_visibleListings.isEmpty) return;

    switch (sortType) {
      case SortType.newest:
      case SortType.oldest:
        _visibleListings.sort((a, b) {
          final aTime = DateTime.tryParse(a.createdAt ?? '') ?? DateTime(0);
          final bTime = DateTime.tryParse(b.createdAt ?? '') ?? DateTime(0);
          return sortType == SortType.newest
              ? bTime.compareTo(aTime)
              : aTime.compareTo(bTime);
        });
        break;

      case SortType.priceLow:
      case SortType.priceHigh:
        _visibleListings.sort((a, b) {
          final aPrice = double.tryParse(a.price ?? '0') ?? 0;
          final bPrice = double.tryParse(b.price ?? '0') ?? 0;
          return sortType == SortType.priceLow
              ? aPrice.compareTo(bPrice)
              : bPrice.compareTo(aPrice);
        });
        break;
    }
  }

  /// Filter listings by type (buy, rent, etc.)
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
