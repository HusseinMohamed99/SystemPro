// 📦 Imports
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/Favorite/favorite_cubit.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_state.dart';
import 'package:system_pro/features/Home/logic/Paginations/pagination_state.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

// 🧩 Sort model
class SortOptionModel {
  SortOptionModel({required this.label, required this.sortType});
  final String label;
  final SortType sortType;
}

// 🧠 MarketplaceCubit: handles listing fetching, filtering,
// sorting, favorites, and hydration
class MarketplaceCubit extends HydratedCubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final List<Listing> _visibleListings = [];
  final Map<String, List<Listing>> _cachedListingsByFilter = {};
  final PaginationState pagination = PaginationState();

  String _currentFilter = '';
  SortType _currentSort = SortType.newest;
  bool _hasLoadedOnce = false;

  List<SortOptionModel> sortOptions = [];

  // 🌟 Public Getters
  SortType get selectedSort => _currentSort;
  String get currentFilter => _currentFilter;

  /// 🟢 Initial one-time fetch
  void initIfNeeded() {
    if (!_hasLoadedOnce) {
      getListings();
      _hasLoadedOnce = true;
    }
  }

  /// 🏷️ Initialize localized sort labels
  void initSortOptionsIfNeeded(BuildContext context) {
    if (sortOptions.isEmpty) {
      sortOptions = [
        SortOptionModel(
          label: context.localization.newest,
          sortType: SortType.newest,
        ),
        SortOptionModel(
          label: context.localization.oldest,
          sortType: SortType.oldest,
        ),
        SortOptionModel(
          label: context.localization.price_low,
          sortType: SortType.priceLow,
        ),
        SortOptionModel(
          label: context.localization.price_high,
          sortType: SortType.priceHigh,
        ),
      ];
    }
  }

  /// 🔖 Get localized label for SortType
  String getLabelForSort(SortType sortType) {
    return sortOptions
        .firstWhere(
          (e) => e.sortType == sortType,
          orElse: () => SortOptionModel(label: '', sortType: sortType),
        )
        .label;
  }

  /// 📥 Public method to fetch listings with filter/caching logic
  Future<void> getListings({String? filter, bool forceRefresh = false}) async {
    final effectiveFilter = (filter?.isNotEmpty ?? false) ? filter! : 'buy';

    if (!forceRefresh &&
        _currentFilter == effectiveFilter &&
        _visibleListings.isNotEmpty) {
      _emitSortedSuccess();
      return;
    }

    if (!forceRefresh && _cachedListingsByFilter.containsKey(effectiveFilter)) {
      _currentFilter = effectiveFilter;
      _visibleListings
        ..clear()
        ..addAll(_cachedListingsByFilter[effectiveFilter]!);
      if (_visibleListings.isNotEmpty) {
        pagination.cursor = _visibleListings.last.id ?? 0;
      }
      _emitSortedSuccess();
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

  /// 🔁 Load next page for current filter
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

  /// 🎯 Fetch with custom args (filter screen)
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

  /// ➕ Load more from filter args
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

  /// 🔄 Internal method that fetches, paginates, and caches listings
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
            _emitSortedSuccess();
            return;
          }

          if (newItems.length < pagination.limit) pagination.hasMore = false;

          _visibleListings.addAll(newItems);
          final lastId = newItems.last.id;
          if (lastId != null) pagination.cursor = lastId;

          if (pagination.cursor == pagination.limit || pagination.cursor == 0) {
            _cachedListingsByFilter[cacheKey] = List.from(_visibleListings);
          }

          _emitSortedSuccess();
        },
        failure:
            (err) => emit(
              MarketplaceState.error('Error: ${err.apiErrorModel.message}'),
            ),
      );
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    } finally {
      pagination.isLoading = false;
    }
  }

  /// 🔃 Apply selected sort type
  void sortListings(SortType sortType, {bool shouldEmit = true}) {
    _currentSort = (sortType == SortType.reset) ? SortType.newest : sortType;
    _sortListings(_currentSort);
    if (shouldEmit) _emitSortedSuccess();
  }

  /// 🔃 Internal sorting logic
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
      case SortType.reset:
        break;
    }
  }

  /// 💖 Toggle favorite status and sync with favorite cubit
  Future<Listing?> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);
      return result.when(
        success: (res) {
          final isFav = res.data?.isFavorited ?? false;
          final index = _visibleListings.indexWhere((l) => l.id == id);
          if (index != -1) {
            _visibleListings[index] = _visibleListings[index].copyWith(
              isFavorite: isFav,
            );
          }

          _emitSortedSuccess();

          final updated = listing?.copyWith(isFavorite: isFav);
          final favoriteCubit = getIt<FavoriteCubit>();
          if (isFav && updated != null) {
            favoriteCubit.addToFavorites(updated);
          } else {
            favoriteCubit.removeFromFavorites(id);
          }

          return updated;
        },
        failure: (err) {
          emit(
            MarketplaceState.error(
              'Favorite toggle failed: ${err.apiErrorModel.message}',
            ),
          );
          return null;
        },
      );
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
      return null;
    }
  }

  /// 🧹 Update listing locally if favorite status changed externally
  void updateListingFavoriteStatus(int listingId, bool isFavorite) {
    final index = _visibleListings.indexWhere((e) => e.id == listingId);
    if (index != -1) {
      _visibleListings[index] = _visibleListings[index].copyWith(
        isFavorite: isFavorite,
      );
      _emitSortedSuccess();
    }
  }

  /// 🧼 Emit sorted success state
  void _emitSortedSuccess() {
    _sortListings(_currentSort);
    emit(
      MarketplaceState.success(
        listings: List.from(_visibleListings),
        selectedFilter: _currentFilter,
      ),
    );
  }

  /// 🧯 Clear hydrated cache manually
  void clearHydratedCache() => clear();

  /// 💾 Convert current state to JSON for hydration
  @override
  Map<String, dynamic>? toJson(MarketplaceState state) {
    return state.whenOrNull(
      success:
          (listings, selectedFilter) => {
            'listings': listings.map((e) => e.toJson()).toList(),
            'filter': selectedFilter,
            'sort': _currentSort.name,
            'cachedListings': _cachedListingsByFilter.map(
              (key, value) =>
                  MapEntry(key, value.map((e) => e.toJson()).toList()),
            ),
          },
    );
  }

  /// ♻️ Rebuild state from saved JSON
  @override
  MarketplaceState? fromJson(Map<String, dynamic> json) {
    try {
      final listingsJson =
          (json['listings'] as List).cast<Map<String, dynamic>>();
      final cachedJson = (json['cachedListings'] as Map<String, dynamic>);

      _cachedListingsByFilter.clear();
      cachedJson.forEach((key, val) {
        _cachedListingsByFilter[key] =
            (val as List).map((e) => Listing.fromJson(e)).toList();
      });

      _visibleListings
        ..clear()
        ..addAll(listingsJson.map(Listing.fromJson));

      _currentFilter = json['filter'] ?? 'buy';
      _currentSort = SortType.values.firstWhere(
        (e) => e.name == json['sort'],
        orElse: () => SortType.newest,
      );

      return MarketplaceState.success(
        listings: _visibleListings,
        selectedFilter: _currentFilter,
      );
    } catch (_) {
      return null;
    }
  }
}
