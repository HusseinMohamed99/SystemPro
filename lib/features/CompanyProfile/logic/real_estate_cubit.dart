import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';

class RealEstateCubit extends Cubit<RealEstateState> {
  RealEstateCubit(this._marketplaceRepo)
    : super(const RealEstateState.initial());
  final MarketplaceRepo _marketplaceRepo;

  void getMarketplaceListings() async {
    emit(const RealEstateState.loading());

    // الحصول على البيانات من الريبو
    final response = await _marketplaceRepo.getMarketplaceListings();

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];

        // إذا كان لديك تصفية، يمكن تطبيقها هنا
        emit(RealEstateState.filtered(listings)); // حالة النجاح
      },
      failure: (error) {
        emit(
          RealEstateState.error(error.apiErrorModel.message ?? ''),
        ); // حالة الخطأ
      },
    );
  }

  // دالة إضافية لتصفية البيانات بناءً على شروط معينة
  void getFilteredListings() async {
    emit(const RealEstateState.loading());

    final response = await _marketplaceRepo.getMarketplaceListings();

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];

        // تصفية العناصر حسب الشروط
        final filtered =
            listings
                .where((listing) => listing.companyId == listing.company?.id)
                .toList();

        emit(RealEstateState.filtered(filtered)); // حالة التصفية
      },
      failure: (error) {
        emit(RealEstateState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
