import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/model/marketplace_response.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';
import 'package:system_pro/features/Search/data/model/filter_result_arg.dart';
class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final List<Listing> _allListings = [];
  final List<Listing> _visibleListings = [];

  String _currentFilter = '';
  int _loadedCount = 0;
  final int _pageSize = 5;

  List<Listing> get _filteredListings {
    if (_currentFilter.isEmpty) return _allListings;
    return _allListings
        .where(
          (listing) =>
              listing.listingType?.toLowerCase() ==
              _currentFilter.toLowerCase(),
        )
        .toList();
  }

  bool get hasMore => _loadedCount < _filteredListings.length;

  Future<void> getListings({String filter = ''}) async {
    emit(const MarketplaceState.loading());

    try {
      final result = await _marketplaceRepo.getMarketplaceListings();

      await result.when(
        success: (MarketplaceResponse response) async {
          final all = response.data?.listings ?? [];
          _allListings
            ..clear()
            ..addAll(all);
          _currentFilter = filter;
          _applyFilter(filter);
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
void _applyFilter(String filter) {
    _currentFilter = filter;
    _loadedCount = 0;
    _visibleListings.clear();

    final nextItems =
        _filteredListings.skip(_loadedCount).take(_pageSize).toList();
    _visibleListings.addAll(nextItems);
    _loadedCount = _visibleListings.length;

    emit(MarketplaceState.success(List.from(_visibleListings)));
  }


  void filterListings(String filter) {
    _applyFilter(filter); // لا حاجة لـ _loadMoreInternal
  }

  void _loadMoreInternal() {
    final nextItems =
        _filteredListings.skip(_loadedCount).take(_pageSize).toList();
    _visibleListings.addAll(nextItems);
    _loadedCount = _visibleListings.length;

    emit(MarketplaceState.success(List.from(_visibleListings)));
  }

  bool isLoading = false; // متغير لتتبع حالة التحميل

Future<void> loadMore() async {
    if (isLoading || !hasMore) {
      return; // تأكد من أنه لا يوجد تحميل قيد التنفيذ أو أنه تم تحميل كل البيانات
    }

    isLoading = true;
    emit(const MarketplaceState.loading());

    try {
      _loadMoreInternal();
    } finally {
      isLoading = false; // عند الانتهاء من التحميل، قم بإيقاف الـ loading
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

    emit(MarketplaceState.success(List.from(_visibleListings)));
  }

  void refreshListings() {
    _allListings.clear();
    _visibleListings.clear();
    _loadedCount = 0;
  }

  Future<void> getFavoriteListings() async {
    emit(const MarketplaceState.getFavoriteLoading());

    try {
      final result = await _marketplaceRepo.getFavoriteListings();

      result.when(
        success: (response) {
          final favoriteListings = response.data ?? [];

          _allListings
            ..clear()
            ..addAll(favoriteListings);
          _visibleListings
            ..clear()
            ..addAll(favoriteListings.take(_pageSize));
          _loadedCount = _visibleListings.length;

          emit(
            MarketplaceState.getFavoriteSuccess(List.from(_visibleListings)),
          );
        },
        failure: (errorHandler) {
          emit(
            MarketplaceState.getFavoriteError(
              'فشل في جلب المفضلات: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      emit(MarketplaceState.getFavoriteError('حدث خطأ غير متوقع: $error'));
    }
  }

  Future<void> toggleFavorite(int id) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      result.when(
        success: (response) {
          if (response.status == 'success') {
            final isFavorited = response.data?.isFavorited ?? false;

            for (var listing in _allListings) {
              if (listing.id == id) {
                listing.isFavorite = isFavorited;
                break;
              }
            }

            final favoriteListings =
                _allListings.where((e) => e.isFavorite == true).toList();

            if (_currentFilter.isEmpty) {
              emit(MarketplaceState.success(List.from(_visibleListings)));
            } else {
              emit(MarketplaceState.getFavoriteSuccess(favoriteListings));
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

  Future<void> fetchAndFilterListings(FilterResultArguments args) async {
    emit(const MarketplaceState.loading());

    try {
      final result = await _marketplaceRepo.getMarketplaceListings();

      await result.when(
        success: (MarketplaceResponse response) async {
          final all = response.data?.listings ?? [];
          _allListings
            ..clear()
            ..addAll(all);

          _applyAdvancedFilter(args);
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

  void _applyAdvancedFilter(FilterResultArguments args) {
    emit(const MarketplaceState.loading());

    _currentFilter = args.category;
    _loadedCount = 0;
    _visibleListings.clear();

    final List<Listing> filtered =
        _allListings.where((listing) {
          final matchCategory =
              args.category.isEmpty ||
              listing.category?.toLowerCase() == args.category.toLowerCase();

          final matchBedrooms =
              args.bedrooms == null || listing.rooms == args.bedrooms;

          final matchBathrooms =
              args.bathrooms == null || listing.bathrooms == args.bathrooms;

          // يمكنك إضافة المزيد من الفلاتر مثل السعر، الموقع، إلخ

          return matchCategory && matchBedrooms && matchBathrooms;
        }).toList();

    final nextItems = filtered.skip(_loadedCount).take(_pageSize).toList();
    _visibleListings.addAll(nextItems);
    _loadedCount = _visibleListings.length;

    emit(MarketplaceState.success(List.from(_visibleListings)));
  }
}
