import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';

class RealEstateCubit extends Cubit<RealEstateState> {
  RealEstateCubit(this._marketplaceRepo)
    : super(const RealEstateState.initial());

  final MarketplaceRepo _marketplaceRepo;

  void getMarketplaceListings() async {
    emit(const RealEstateState.loading());

    final response = await _marketplaceRepo.getMarketplaceListings();

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];
        emit(RealEstateState.filtered(listings));
      },
      failure: (error) {
        emit(RealEstateState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }

  void getFilteredListings() async {
    emit(const RealEstateState.loading());

    final response = await _marketplaceRepo.getMarketplaceListings();

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];
        final filtered =
            listings
                .where((listing) => listing.companyId == listing.company?.id)
                .toList();
        emit(RealEstateState.filtered(filtered));
      },
      failure: (error) {
        emit(RealEstateState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }

  /// ✅ هذه الدالة لحالة CompanyProfileView
  void getListingsByCompany(int companyId) async {
    emit(const RealEstateState.loading());

    final response = await _marketplaceRepo.getMarketplaceListings();

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];
        final filtered =
            listings
                .where((listing) => listing.company?.id == companyId)
                .toList();
        emit(RealEstateState.filtered(filtered));
      },
      failure: (error) {
        emit(RealEstateState.error(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
