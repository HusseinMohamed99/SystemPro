import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/model/marketplace_response.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final List<Listing> _visibleListings = [];
  String _currentFilter = '';
  bool isLoading = false;
  bool hasMore = true;

  int _cursor = 0;
  final int _limit = 5;
  String _direction = 'next';

  String get currentFilter => _currentFilter;

  Future<void> getListings({String? filter}) async {
    emit(const MarketplaceState.loading());
    _resetPagination();

    final effectiveFilter = filter?.isNotEmpty == true ? filter! : 'buy';
    _currentFilter = effectiveFilter;

    await _fetchListings(filter: effectiveFilter);
  }

  Future<void> _fetchListings({String filter = ''}) async {
    if (isLoading || !hasMore) return;
    isLoading = true;

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        direction: _direction,
        cursor: _cursor,
        limit: _limit,
      );

      await result.when(
        success: (MarketplaceResponse response) async {
          final allItems = response.data?.listings ?? [];

          // ✅ نفلتر النتائج حسب نوع الفلتر (buy/rent)
          final newItems =
              allItems
                  .where(
                    (listing) =>
                        listing.listingType?.toLowerCase() ==
                        filter.toLowerCase(),
                  )
                  .toList();

          if (newItems.isEmpty || newItems.length < _limit) {
            hasMore = false;
          }

          _visibleListings.addAll(newItems);

          if (_visibleListings.isNotEmpty) {
            _cursor = _visibleListings.last.id ?? _cursor;
          }

          emit(
            MarketplaceState.success(
              listings: List.from(_visibleListings),
              selectedFilter: _currentFilter,
            ),
          );
        },
        failure: (errorHandler) {
          emit(
            MarketplaceState.error(
              'حدث خطأ في تحميل البيانات: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      emit(MarketplaceState.error('حدث خطأ غير متوقع: $error'));
    } finally {
      isLoading = false;
    }
  }

  Future<void> loadMore() async {
    await _fetchListings(filter: _currentFilter);
  }

  void _resetPagination() {
    _visibleListings.clear();
    _cursor = 0;
    hasMore = true;
    isLoading = false;
    _direction = 'next';
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
    } else if (sortType == priceLow) {
      _visibleListings.sort((a, b) {
        final aPrice = double.tryParse(a.price ?? '0.0') ?? 0.0;
        final bPrice = double.tryParse(b.price ?? '0.0') ?? 0.0;
        return aPrice.compareTo(bPrice);
      });
    } else if (sortType == priceHigh) {
      _visibleListings.sort((a, b) {
        final aPrice = double.tryParse(a.price ?? '0.0') ?? 0.0;
        final bPrice = double.tryParse(b.price ?? '0.0') ?? 0.0;
        return bPrice.compareTo(aPrice);
      });
    }

    emit(
      MarketplaceState.success(
        listings: List.from(_visibleListings),
        selectedFilter: _currentFilter,
      ),
    );
  }

  Future<void> fetchAndFilterListings(FilterResultArguments args) async {
    emit(const MarketplaceState.loading());
    _resetPagination();

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        direction: _direction,
        cursor: _cursor,
        limit: _limit,
      );

      await result.when(
        success: (MarketplaceResponse response) async {
          final all = response.data?.listings ?? [];

          final filtered =
              all.where((listing) {
                final matchCategory =
                    args.category.isEmpty ||
                    listing.category?.toLowerCase() ==
                        args.category.toLowerCase();
                final matchBedrooms =
                    args.bedrooms == null || listing.rooms == args.bedrooms;
                final matchBathrooms =
                    args.bathrooms == null ||
                    listing.bathrooms == args.bathrooms;
                return matchCategory && matchBedrooms && matchBathrooms;
              }).toList();

          _visibleListings.addAll(filtered);
          if (_visibleListings.isNotEmpty) {
            _cursor = _visibleListings.last.id ?? _cursor;
          }

          hasMore = filtered.length >= _limit;

          emit(
            MarketplaceState.success(
              listings: List.from(_visibleListings),
              selectedFilter: _currentFilter,
            ),
          );
        },
        failure: (errorHandler) {
          emit(
            MarketplaceState.error(
              'حدث خطأ في تحميل البيانات: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      emit(MarketplaceState.error('حدث خطأ غير متوقع: $error'));
    }
  }

  Future<void> filterListings(String filter) async {
    _currentFilter = filter;

    final filtered =
        _visibleListings.where((listing) {
          return listing.listingType?.toLowerCase() == filter.toLowerCase();
        }).toList();

    emit(
      MarketplaceState.success(
        listings: filtered,
        selectedFilter: _currentFilter,
      ),
    );
  }

  /// FAVORITES
  Future<void> toggleFavorite(int id) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      result.when(
        success: (response) {
          if (response.status == 'success') {
            final isFavorited = response.data?.isFavorited ?? false;

            for (var listing in _visibleListings) {
              if (listing.id == id) {
                listing.isFavorite = isFavorited;
                break;
              }
            }

            emit(
              MarketplaceState.success(
                listings: List.from(_visibleListings),
                selectedFilter: _currentFilter,
              ),
            );
          } else {
            emit(const MarketplaceState.error('فشل في تبديل المفضلة'));
          }
        },
        failure: (errorHandler) {
          emit(
            MarketplaceState.error(
              'فشل في التبديل: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      emit(MarketplaceState.error('حدث خطأ غير متوقع: $error'));
    }
  }
}
