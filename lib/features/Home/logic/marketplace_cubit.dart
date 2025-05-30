import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/di/dependency_injection.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/model/marketplace_response.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/favorite_cubit.dart';
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
  int _limit = 5;
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
        listingType: filter,
      );

      await result.when(
        success: (MarketplaceResponse response) async {
          final newItems = response.data?.listings ?? [];

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

  Future<void> loadMoreWithArgs(FilterResultArguments args) async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    _limit += 5;

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        direction: _direction,
        cursor: _cursor,
        limit: _limit,
        listingType: args.listingType,
        categoryID: args.category,
        subCategoryID: args.selectedSubcategories,
        bedrooms: args.bedrooms,
        bathrooms: args.bathrooms,
        priceMin: args.minPrice,
        priceMax: args.maxPrice,
        areaMin: args.minSize,
        areaMax: args.maxSize,
        amenities: args.selectedAmenities,
        location: args.location,
      );

      await result.when(
        success: (MarketplaceResponse response) async {
          final newItems = response.data?.listings ?? [];

          _visibleListings.addAll(newItems);

          if (_visibleListings.isNotEmpty) {
            _cursor = _visibleListings.last.id ?? _cursor;
          }

          hasMore = newItems.length >= _limit;

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
              'حدث خطأ في تحميل المزيد: ${errorHandler.apiErrorModel.message}',
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

  void _resetPagination() {
    _visibleListings.clear();
    _cursor = 0;
    _limit = 5;
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
        location: args.location,
        listingType: args.listingType,
        categoryID: args.category,
        subCategoryID: args.selectedSubcategories,
        bedrooms: args.bedrooms,
        bathrooms: args.bathrooms,
        priceMin: args.minPrice,
        priceMax: args.maxPrice,
        areaMin: args.minSize,
        areaMax: args.maxSize,
        amenities: args.selectedAmenities,
      );

      await result.when(
        success: (response) async {
          var newItems = response.data?.listings ?? [];

          // إذا مفيش نتائج، حاول بالفلاتر الأساسية فقط
          if (newItems.isEmpty) {
            final fallbackResult = await _marketplaceRepo
                .getMarketplaceListings(
                  direction: _direction,
                  cursor: _cursor,
                  limit: _limit,
                  location: args.location,
                  listingType: args.listingType,
                  categoryID: args.category,
                  subCategoryID: args.selectedSubcategories,
                  // باقي الفلاتر ما نمررهاش
                );

            fallbackResult.when(
              success: (fallbackResponse) {
                newItems = fallbackResponse.data?.listings ?? [];
              },

              failure: (fallbackError) {
                emit(
                  MarketplaceState.error(
                    'فشل في تحميل النتائج البديلة: ${fallbackError.apiErrorModel.message}',
                  ),
                );
                return;
              },
            );
          }

          _visibleListings.addAll(newItems);

          if (_visibleListings.isNotEmpty) {
            _cursor = _visibleListings.last.id ?? _cursor;
          }

          hasMore = newItems.length >= _limit;

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
        _visibleListings
            .where(
              (listing) =>
                  listing.listingType?.toLowerCase() == filter.toLowerCase(),
            )
            .toList();

    emit(
      MarketplaceState.success(
        listings: filtered,
        selectedFilter: _currentFilter,
      ),
    );
  }

  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      await result.when(
        success: (response) async {
          if (response.status == 'success') {
            final isFavorited = response.data?.isFavorited ?? false;

            Listing? updatedListing;

            for (var l in _visibleListings) {
              if (l.id == id) {
                l.isFavorite = isFavorited;
                updatedListing = l;
                break;
              }
            }

            emit(
              MarketplaceState.success(
                listings: List.from(_visibleListings),
                selectedFilter: _currentFilter,
              ),
            );

            final favoriteCubit = getIt<FavoriteCubit>();

            if (isFavorited && updatedListing != null) {
              favoriteCubit.addToFavorites(updatedListing);
            } else {
              favoriteCubit.removeFromFavorites(id);
            }
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
