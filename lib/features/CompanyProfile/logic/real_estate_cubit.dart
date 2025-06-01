import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';

class RealEstateCubit extends Cubit<RealEstateState> {
  RealEstateCubit(this._marketplaceRepo)
    : super(const RealEstateState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final List<Listing> _companyListings = [];
  bool isLoading = false;
  bool hasMore = true;
  int _cursor = 0;
  final int _limit = 5;
  String _direction = 'next';
  int _currentCompanyId = 0;

  void getListingsByCompany({
    required int companyId,
    String direction = 'next',
    int cursor = 0,
    int limit = 5,
  }) async {
    emit(const RealEstateState.loading());

    _resetPagination(companyId);

    await _fetchCompanyListings(
      companyId: companyId,
      direction: direction,
      cursor: cursor,
      limit: limit,
    );
  }

  Future<void> loadMoreListingsByCompany() async {
    if (isLoading || !hasMore) return;

    await _fetchCompanyListings(
      companyId: _currentCompanyId,
      direction: _direction,
      cursor: _cursor,
      limit: _limit,
    );
  }

  Future<void> _fetchCompanyListings({
    required int companyId,
    required String direction,
    required int cursor,
    required int limit,
  }) async {
    isLoading = true;

    final response = await _marketplaceRepo.getMarketplaceListings(
      FilterRequestModel(
         direction: direction,
      cursor: cursor,
      limit: limit, 
      ),
    
      // listingType: 'rent',
    );

    response.when(
      success: (data) {
        final allListings = data.data?.listings ?? [];
        final filtered =
            allListings
                .where((listing) => listing.company?.id == companyId)
                .toList();

        if (filtered.isEmpty || filtered.length < limit) {
          hasMore = false;
        }

        _companyListings.addAll(filtered);
        if (_companyListings.isNotEmpty) {
          _cursor = _companyListings.last.id ?? _cursor;
        }

        emit(RealEstateState.filtered(List.from(_companyListings)));
      },
      failure: (error) {
        emit(RealEstateState.error(error.apiErrorModel.message ?? ''));
      },
    );

    isLoading = false;
  }

  void _resetPagination(int companyId) {
    _companyListings.clear();
    _cursor = 0;
    hasMore = true;
    isLoading = false;
    _direction = 'next';
    _currentCompanyId = companyId;
  }
}
