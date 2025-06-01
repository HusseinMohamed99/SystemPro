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

  /// إعادة تعيين حالة التحميل والصفحة
  void _resetPagination() {
    _visibleListings.clear();
    _cursor = 0;
    _limit = 5;
    _direction = 'next';
    isLoading = false;
    hasMore = true;
  }

  /// تحميل أولي للإعلانات حسب الفلتر (buy/rent)
  Future<void> getListings({String? filter}) async {
    emit(const MarketplaceState.loading());
    _resetPagination();
    final effectiveFilter = filter?.isNotEmpty == true ? filter! : 'buy';
    _currentFilter = effectiveFilter;
    await _fetchListings(filter: effectiveFilter);
  }

  /// تحميل المزيد من الإعلانات
  Future<void> loadMore() async {
    await _fetchListings(filter: _currentFilter);
  }

  /// تحميل المزيد باستخدام الفلاتر المعقدة
  Future<void> loadMoreWithArgs(FilterResultArguments args) async {
    if (isLoading || !hasMore) return;
    isLoading = true;

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        FilterRequestModel(
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
        ),
      );

      await _handleResponse(result);
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    } finally {
      isLoading = false;
    }
  }

  /// تنفيذ منطق تحميل الإعلانات
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

  /// دالة موحدة للتعامل مع الاستجابة
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

  /// إرسال حالة النجاح إلى الواجهة
  void _emitSuccessState() {
    emit(
      MarketplaceState.success(
        listings: List.from(_visibleListings),
        selectedFilter: _currentFilter,
      ),
    );
  }

  /// تطبيق فلترة باستخدام بيانات مفصلة
  Future<void> fetchAndFilterListings(FilterResultArguments args) async {
    emit(const MarketplaceState.loading());
    _resetPagination();

    try {
      final result = await _marketplaceRepo.getMarketplaceListings(
        FilterRequestModel(
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
        ),
      );

      await _handleResponse(result);
    } catch (e) {
      emit(MarketplaceState.error('Unexpected error: $e'));
    }
  }

  /// تبديل حالة الإعلان كمفضل أو لا
  Future<void> toggleFavorite(int id, {Listing? listing}) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      result.when(
        success: (res) {
          final isFav = res.data?.isFavorited ?? false;

          for (var i = 0; i < _visibleListings.length; i++) {
            if (_visibleListings[i].id == id) {
              _visibleListings[i] = _visibleListings[i].copyWith(
                isFavorite: isFav,
              );
              break;
            }
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

  /// تطبيق فلتر بسيط على الإعلانات الظاهرة
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

  /// ترتيب الإعلانات بناءً على نوع الترتيب
  void sortListings({
    required String newest,
    required String priceLow,
    required String priceHigh,
    required String sortType,
  }) {
    if (_visibleListings.isEmpty) return;

    if (sortType == newest) {
      _visibleListings.sort(
        (a, b) =>
            DateTime.tryParse(
              b.createdAt ?? '',
            )?.compareTo(DateTime.tryParse(a.createdAt ?? '') ?? DateTime(0)) ??
            0,
      );
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
