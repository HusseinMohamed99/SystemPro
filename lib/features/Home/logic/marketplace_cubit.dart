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

  void refreshListings() {
    _allListings.clear();
    _visibleListings.clear();
    _loadedCount = 0;
  }

  Future<void> toggleFavorite(int id) async {
    try {
      final result = await _marketplaceRepo.toggleFavorite(id);

      result.when(
        success: (response) {
          print('Success Response: ${response.status}');
          if (response.status == 'success') {
            final isFavorited = response.data?.isFavorited ?? false;
            print('isFavorited: $isFavorited');

            // تحديث حالة المفضلة في جميع العناصر التي تحتوي على id مطابق
            for (var listing in _allListings) {
              if (listing.id == id) {
                listing.isFavorite = isFavorited; // التعديل هنا
              }
            }

            emit(MarketplaceState.success(List.from(_visibleListings)));
          } else {
            emit(const MarketplaceState.error('فشل في تبديل المفضلة'));
          }
        },
        failure: (errorHandler) {
          print('Error: ${errorHandler.apiErrorModel.message}');
          emit(
            MarketplaceState.error(
              'فشل في التبديل: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      print('Unexpected error: $error');
      emit(MarketplaceState.error('حدث خطأ غير متوقع: $error'));
    }
  }

  // ✅ فلترة متقدمة باستخدام FilterResultArguments
  Future<void> fetchAndFilterListings(FilterResultArguments args) async {
    emit(const MarketplaceState.loading());

    try {
      // جلب البيانات من الـ API
      final result = await _marketplaceRepo.getMarketplaceListings();

      await result.when(
        success: (MarketplaceResponse response) async {
          final all = response.data?.listings ?? [];
          _allListings.clear();
          _visibleListings.clear();
          _loadedCount = 0;
          _currentFilter = args.category;

          _allListings.addAll(all);

          // بعد جلب البيانات نطبق الفلاتر
          applyFilterForResult(args);
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

  void applyFilterForResult(FilterResultArguments args) {
    emit(const MarketplaceState.loading());

    // تحديث الفلاتر
    _currentFilter = args.category;
    _loadedCount = 0;
    _visibleListings.clear();

    final bool noFiltersApplied =
        _currentFilter.isEmpty &&
        args.buyRentOption.isEmpty &&
        args.selectedSubcategories.isEmpty &&
        args.minPrice == null &&
        args.maxPrice == null &&
        args.bedrooms == null &&
        args.bathrooms == null &&
        args.minSize == null &&
        args.maxSize == null &&
        args.selectedAmenities.isEmpty;

    List<Listing> filteredData = _allListings;

    if (!noFiltersApplied) {
      // فلترة حسب نوع العملية (شراء أو إيجار)
      if (args.buyRentOption.isNotEmpty) {
        filteredData =
            filteredData
                .where(
                  (listing) =>
                      listing.listingType?.toLowerCase() ==
                      args.buyRentOption.toLowerCase(),
                )
                .toList();
      }

      // فلترة حسب التصنيف الرئيسي (Commercial, Residential)
      if (_currentFilter.isNotEmpty) {
        filteredData =
            filteredData
                .where(
                  (listing) =>
                      listing.category?.toLowerCase() ==
                      _currentFilter.toLowerCase(),
                )
                .toList();
      }

      // فلترة حسب التصنيفات الفرعية (لو مش مختار لازم نشمل كل التصنيفات)
      if (args.selectedSubcategories.isNotEmpty) {
        filteredData =
            filteredData.where((listing) {
              final subName = listing.subcategory?.name?.toLowerCase() ?? '';
              return args.selectedSubcategories
                  .map((e) => e.toLowerCase())
                  .contains(subName);
            }).toList();
      }

      // فلترة حسب عدد الغرف (إذا اختار رقم معين يجب أن يتطابق مع البيانات)
      if (args.bedrooms != null) {
        if (args.bedrooms == -1) {
          // إذا اختار "any"، نعرض جميع الأعداد
          filteredData =
              filteredData.where((listing) => listing.rooms != null).toList();
        } else {
          filteredData =
              filteredData
                  .where((listing) => listing.rooms == args.bedrooms)
                  .toList();
        }
      }

      // فلترة حسب عدد الحمامات
      if (args.bathrooms != null) {
        if (args.bathrooms == -1) {
          // إذا اختار "any"، نعرض جميع الأعداد
          filteredData =
              filteredData
                  .where((listing) => listing.bathrooms != null)
                  .toList();
        } else {
          filteredData =
              filteredData
                  .where((listing) => listing.bathrooms == args.bathrooms)
                  .toList();
        }
      }

      // فلترة حسب سعر العقار (minPrice, maxPrice)
      if (args.minPrice != null || args.maxPrice != null) {
        filteredData =
            filteredData.where((listing) {
              final price = double.tryParse(listing.price ?? '0.0');
              bool matchesPrice = true;
              if (args.minPrice != null) {
                matchesPrice = price != null && price >= args.minPrice!;
              }
              if (args.maxPrice != null) {
                matchesPrice =
                    matchesPrice && price != null && price <= args.maxPrice!;
              }
              return matchesPrice;
            }).toList();
      }

      // فلترة حسب المساحة (minSize, maxSize)
      if (args.minSize != null) {
        filteredData =
            filteredData.where((listing) {
              final size = double.tryParse(listing.area ?? '0.0');
              return size != null && size >= args.minSize!;
            }).toList();
      }

      if (args.maxSize != null) {
        filteredData =
            filteredData.where((listing) {
              final size = double.tryParse(listing.area ?? '0.0');
              return size != null && size <= args.maxSize!;
            }).toList();
      }

      // فلترة حسب الـ Amenities (لو مش مختار نعرض كل الـ amenities)
      if (args.selectedAmenities.isNotEmpty) {
        filteredData =
            filteredData.where((listing) {
              final amenities = listing.amenities ?? [];
              return amenities.any(
                (amenity) => args.selectedAmenities.contains(amenity.id),
              );
            }).toList();
      }
    }

    // طباعة البيانات بعد الفلترة
    print('Filtered Listings:');
    for (var listing in filteredData) {
      print(
        'Listing ID: ${listing.id}, Price: ${listing.price}, Rooms: ${listing.rooms}, Bathrooms: ${listing.bathrooms}, Area: ${listing.area}, PropertyType: ${listing.subcategory?.name}, Amenities: ${listing.amenities?.map((amenity) => amenity.name).join(', ')}',
      );
    }

    // تحميل أول دفعة للعرض
    final nextItems = filteredData.skip(_loadedCount).take(_pageSize).toList();
    _visibleListings.addAll(nextItems);
    _loadedCount = _visibleListings.length;

    emit(MarketplaceState.success(List.from(_visibleListings)));
  }
}
