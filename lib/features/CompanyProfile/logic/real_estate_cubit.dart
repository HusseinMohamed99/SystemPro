import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';

class RealEstateCubit extends Cubit<RealEstateState> {
  RealEstateCubit(this._marketplaceRepo)
    : super(const RealEstateState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final Map<int, List<Listing>> _cachedListingsBySource = {};

  int _cursor = 0;
  bool isLoading = false;
  bool hasMore = true;
  final int _limit = 5;
  String _direction = 'next';
  int _currentSourceId = 0;
  bool _currentIsCompany = false;
  int _apiCallCount = 0;

  List<Listing> get _currentListings =>
      _cachedListingsBySource[_currentSourceId] ?? [];

  int get apiCallCount => _apiCallCount;

  Future<void> getListingsBySource({int? companyId, int? marketerId}) async {
    final int? sourceId = companyId ?? marketerId;
    final bool isCompany = companyId != null;

    if (sourceId == null) {
      emit(const RealEstateState.error('Missing companyId or marketerId'));
      return;
    }

    if (_currentSourceId == sourceId &&
        _currentIsCompany == isCompany &&
        _currentListings.isNotEmpty) {
      return;
    }

    _currentSourceId = sourceId;
    _currentIsCompany = isCompany;
    _resetPagination();

    emit(const RealEstateState.loading());
    await _fetchListings();
  }

  Future<void> loadMoreListingsBySource() async {
    if (isLoading || !hasMore) return;

    emit(RealEstateState.loadingMore(_currentListings));
    await _fetchListings();
  }

  Future<void> _fetchListings() async {
    isLoading = true;
    _apiCallCount++;
    debugPrint('📡 API Call #$_apiCallCount for source $_currentSourceId');

    final response = await _marketplaceRepo.getMarketplaceListings(
      FilterRequestModel(
        direction: _direction,
        cursor: _cursor,
        limit: _limit,
        companyId: _currentIsCompany ? _currentSourceId : null,
        marketerId: !_currentIsCompany ? _currentSourceId : null,
      ),
    );

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];

        if (listings.isEmpty || listings.length < _limit) {
          hasMore = false;
        }

        _cachedListingsBySource[_currentSourceId] ??= [];
        _cachedListingsBySource[_currentSourceId]!.addAll(listings);

        // ✅ حماية من تكرار الـ cursor
        if (_currentListings.isNotEmpty) {
          final lastId = _currentListings.last.id;
          if (lastId != null && lastId != _cursor) {
            _cursor = lastId;
          }
        }

        debugPrint(
          '📦 [Backend] ${listings.length} listings fetched for '
          '${_currentIsCompany ? 'Company' : 'Marketer'} $_currentSourceId',
        );

        emit(RealEstateState.filtered(List.from(_currentListings)));
      },
      failure: (error) {
        emit(
          RealEstateState.error(error.apiErrorModel.message ?? 'Unknown error'),
        );
      },
    );

    isLoading = false;
  }

  void _resetPagination() {
    _cachedListingsBySource[_currentSourceId] = [];
    _cursor = 0;
    hasMore = true;
    isLoading = false;
    _direction = 'next';
  }
}
