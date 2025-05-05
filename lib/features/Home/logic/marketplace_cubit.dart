import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';
import 'package:system_pro/features/Home/logic/marketplace_state.dart';

class MarketplaceCubit extends Cubit<MarketplaceState> {
  MarketplaceCubit(this._marketplaceRepo)
    : super(const MarketplaceState.initial());
  final MarketplaceRepo _marketplaceRepo;

  void getListings() async {
    emit(const MarketplaceState.loading());
    final response = await _marketplaceRepo.getMarketplaceListings();

    response.when(
      success:
          (data) => emit(MarketplaceState.success(data.data?.listings ?? [])),
      failure:
          (error) =>
              emit(MarketplaceState.error(error.apiErrorModel.message ?? '')),
    );
  }
  void getFilteredListings() async {
    emit(const MarketplaceState.loading());
    final response = await _marketplaceRepo.getMarketplaceListings();

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];

        // الحالة العادية
        emit(MarketplaceState.success(listings));

        // الحالة الجديدة: تصفية العناصر التي تحقق الشرط
        final filtered =
            listings
                .where((listing) => listing.companyId == listing.company?.id)
                .toList();

        emit(MarketplaceState.filtered(filtered));
      },
      failure: (error) {
        emit(MarketplaceState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }

}
