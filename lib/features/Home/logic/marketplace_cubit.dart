import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/model/marketplace_response.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final List<Listing> _allListings = [];
  final List<Listing> _visibleListings = [];

  String _currentFilter = '';
  int _loadedCount = 0;
  final int _pageSize = 10;


  Future<void> getListings({String filter = ''}) async {
    emit(const MarketplaceState.loading());

    try {
      final result = await _marketplaceRepo.getMarketplaceListings();

      await result.when(
        success: (MarketplaceResponse response) async {
          final all = response.data?.listings ?? [];
          _allListings.clear();
          _visibleListings.clear();
          _loadedCount = 0;
          _currentFilter = filter;

          _allListings.addAll(all);
          _applyFilter(filter);
          _loadMoreInternal();
        },

        failure: (ErrorHandler errorHandler) {
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

    List<Listing> filteredData = [];

    if (filter.isEmpty) {
      filteredData = List.from(_allListings);
    } else {
      filteredData =
          _allListings
              .where(
                (listing) =>
                    listing.listingType?.toLowerCase() == filter.toLowerCase(),
              )
              .toList();
    }

    final nextItems = filteredData.skip(_loadedCount).take(_pageSize).toList();
    _visibleListings.addAll(nextItems);
    _loadedCount = _visibleListings.length;

    emit(MarketplaceState.success(List.from(_visibleListings)));
  }

  void filterListings(String filter) {
    _applyFilter(filter);
    _loadMoreInternal();
  }

  void _loadMoreInternal() {
    final allFiltered =
        _currentFilter.isEmpty
            ? _allListings
            : _allListings
                .where(
                  (listing) =>
                      listing.listingType?.toLowerCase() ==
                      _currentFilter.toLowerCase(),
                )
                .toList();

    final nextItems = allFiltered.skip(_loadedCount).take(_pageSize).toList();
    _visibleListings.addAll(nextItems);
    _loadedCount = _visibleListings.length;

    emit(MarketplaceState.success(List.from(_visibleListings)));
  }

  void loadMore() {
    if (_loadedCount < _allListings.length) {
      _loadMoreInternal();
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



  Future<void> getFavoriteListings() async {
    emit(const MarketplaceState.getFavoriteLoading());

    try {
      final result = await _marketplaceRepo.getFavoriteListings();

      result.when(
        success: (response) {
          final favoriteListings = response.data ?? [];

          if (favoriteListings.isEmpty) {
            emit(const MarketplaceState.getFavoriteSuccess([]));
            return;
          }

          _allListings
            ..clear()
            ..addAll(favoriteListings);
          _visibleListings
            ..clear()
            ..addAll(favoriteListings.take(_pageSize));

          _loadedCount = _visibleListings.length;

          emit(MarketplaceState.getFavoriteSuccess(List.from(_visibleListings)));
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
}
