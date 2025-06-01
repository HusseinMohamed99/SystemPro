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

/// Cubit class that manages real estate marketplace listings,
/// including filtering, pagination, sorting, and favorite toggling.
class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;
  final List<Listing> _visibleListings = [];

  String _currentFilter = '';
  String get currentFilter => _currentFilter;

  int _cursor = 0;
  int _limit = 5;
  String _direction = 'next';
  bool isLoading = false;
  bool hasMore = true;

  /// Resets pagination and related flags
  void _resetPagination() {
    _visibleListings.clear();
    _cursor = 0;
    _limit = 5;
    _direction = 'next';
    isLoading = false;
    hasMore = true;
  }

  /// Initial fetch of listings by filter type (e.g. buy/rent)
  Future<void> getListings({String? filter}) async {
    emit(const MarketplaceState.loading());
    _resetPagination();

    final effectiveFilter = filter?.isNotEmpty == true ? filter! : 'buy';
    _currentFilter = effectiveFilter;

    await _fetchListings(filter: effectiveFilter);
  }

  /// Load more listings (used for infinite scroll)
  Future<void> loadMore() async {
    await _fetchListings(filter: _currentFilter);
  }

  /// Fetch listings with complex filters (via search screen)
  Future<void> loadMoreWithArgs(FilterResultArguments args) async {
    if (isLoading || !hasMore) return;
    isLoading = true;

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        FilterRequestModel.fromArgs(
          args,
        ).copyWith(direction: _direction, cursor: _cursor, limit: _limit),
      );

      await _handleResponse(result);
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    } finally {
      isLoading = false;
    }
  }

  /// Internal fetch logic
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

  /// Unified response handler
  Future<void> _handleResponse(ApiResult<MarketplaceResponse> result) async {
    result.when(
      success: (response) {
        final newItems = response.data?.listings ?? [];

        if (newItems.isEmpty || newItems.length < _limit) {
          hasMore = false;
        }

        _visibleListings.addAll(newItems);

        if (_visibleListings.isNotEmpty) {
          _cursor = _visibleListings.last.id ?? _cursor;
        }

        _emitSuccessState();
      },
      failure: (error) {
        emit(MarketplaceState.error('Error: ${error.apiErrorModel.message}'));
      },
    );
  }

  /// Emits the success state with current visible listings
  void _emitSuccessState() {
    emit(
      MarketplaceState.success(
        listings: List.from(_visibleListings),
        selectedFilter: _currentFilter,
      ),
    );
  }

  /// Search filter logic with full args
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

  /// Toggles favorite state and updates both listings + FavoriteCubit
  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      result.when(
        success: (res) {
          final isFav = res.data?.isFavorited ?? false;

          // update local listing
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

  /// Filters currently visible listings by type (e.g., buy/rent)
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

  /// Sort listings based on provided criteria
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
}
