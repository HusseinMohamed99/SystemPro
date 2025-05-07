import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/features/Home/data/model/listing.dart';
import 'package:system_pro/features/Home/data/model/marketplace_response.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());

  final MarketplaceRepo _marketplaceRepo;
  final List<Listing> _allListings = [];
  List<Listing> _filteredListings = [];
  int _loadedCount = 0;
  final int _pageSize = 10;

  // دالة لتحميل العناصر
  void getListings({String filter = ''}) async {
    // إذا تم تحميل جميع العناصر مسبقًا، لا حاجة لإعادة تحميلها
    if (_loadedCount > 0 && _loadedCount >= _allListings.length) return;

    emit(const MarketplaceState.loading());

    try {
      final result = await _marketplaceRepo.getMarketplaceListings();

      result.when(
        success: (MarketplaceResponse response) {
          final newListings = response.data?.listings ?? [];

          if (newListings.isEmpty) {
            // إذا كانت القائمة فارغة، نعرض القائمة المفلترة الحالية
            emit(MarketplaceState.success(_filteredListings));
          } else {
            _allListings.addAll(
              newListings,
            ); // إضافة العناصر الجديدة للقائمة الكاملة
            _loadedCount = _allListings.length; // تحديث عدد العناصر المحملة
            _applyFilter(filter); // تطبيق الفلتر المحدد
            emit(
              MarketplaceState.success(_filteredListings),
            ); // إظهار العناصر بعد الفلترة
          }
        },
        failure: (ErrorHandler errorHandler) {
          // في حال حدوث خطأ في تحميل البيانات
          emit(
            MarketplaceState.error(
              'حدث خطأ في تحميل البيانات: ${errorHandler.apiErrorModel.message}',
            ),
          );
        },
      );
    } catch (error) {
      // في حال حدوث استثناء غير متوقع
      emit(MarketplaceState.error('حدث خطأ غير متوقع: $error'));
    }
  }

  // دالة لتطبيق الفلتر
  void _applyFilter(String filter) {
    if (filter.isEmpty) {
      _filteredListings = List.from(
        _allListings,
      ); // إذا كان الفلتر فارغًا، إظهار كل العناصر
    } else {
      // تطبيق الفلتر حسب نوع الإعلان
      _filteredListings =
          _allListings.where((listing) {
            return listing.listingType?.toLowerCase() == filter.toLowerCase();
          }).toList();
    }
  }

  // دالة للتصفية عند اختيار Buy أو Rent
  void filterListings(String filter) {
    _applyFilter(filter); // تطبيق الفلتر
    emit(MarketplaceState.success(_filteredListings)); // تحديث واجهة المستخدم
  }

  void sortListings(String sortType) {
    switch (sortType) {
      case 'newest':
        // ترتيب العناصر حسب التاريخ (الأحدث أولاً)
        _filteredListings.sort((a, b) {
          final timestampA =
              DateTime.tryParse(a.createdAt ?? '') ?? DateTime(0);
          final timestampB =
              DateTime.tryParse(b.createdAt ?? '') ?? DateTime(0);
          return timestampB.compareTo(timestampA); // ترتيب تنازلي حسب الوقت
        });
        break;
      case 'price_low':

        // ترتيب العناصر حسب السعر (من الأقل إلى الأعلى)
        _filteredListings.sort((a, b) {
          final priceA = double.tryParse(a.price ?? '0.0') ?? 0.0;
          final priceB = double.tryParse(b.price ?? '0.0') ?? 0.0;
          return priceA.compareTo(priceB); // ترتيب تصاعدي حسب السعر
        });
        break;
      case 'price_high':
        // ترتيب العناصر حسب السعر (من الأعلى إلى الأقل)
        _filteredListings.sort((a, b) {
          final priceA = double.tryParse(a.price ?? '0.0') ?? 0.0;
          final priceB = double.tryParse(b.price ?? '0.0') ?? 0.0;
          return priceB.compareTo(priceA); // ترتيب تنازلي حسب السعر
        });
        break;
      default:
        break; // إذا لم يتم تحديد نوع الترتيب، لا يتم التعديل
    }

    // تحديث واجهة المستخدم بعد ترتيب العناصر
    emit(MarketplaceState.success(_filteredListings));
  }
}
