import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';

/// Cubit responsible for fetching and paginating real estate listings
/// filtered by either company or marketer.
/// Includes caching per sourceId and loadingMore support.
class RealEstateCubit extends Cubit<RealEstateState> {
  RealEstateCubit(this._marketplaceRepo)
    : super(const RealEstateState.initial());

  final MarketplaceRepo _marketplaceRepo;

  // Map of cached listings per sourceId
  final Map<int, List<Listing>> _cachedListingsBySource = {};

  // Pagination state
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

  /// Loads first page of listings based on source (company or marketer)
  Future<void> getListingsBySource({int? companyId, int? marketerId}) async {
    final int? sourceId = companyId ?? marketerId;
    final bool isCompany = companyId != null;

    if (sourceId == null) {
      emit(const RealEstateState.error('Missing companyId or marketerId'));
      return;
    }

    _currentSourceId = sourceId;
    _currentIsCompany = isCompany;
    _resetPagination();

    emit(const RealEstateState.loading());

    await _fetchListings();
  }

  /// Loads next page of listings if not already loading or fully loaded.
  Future<void> loadMoreListingsBySource() async {
    if (isLoading || !hasMore) return;

    emit(RealEstateState.loadingMore(_currentListings));

    await _fetchListings();
  }

  /// Internal API call to fetch listings and apply client-side filter.
  Future<void> _fetchListings({bool autoRetryOnEmpty = true}) async {
    isLoading = true;

    _apiCallCount++; // ✅ زيادة العدّاد
    debugPrint('📡 API Call #$_apiCallCount for source $_currentSourceId');

    final response = await _marketplaceRepo.getMarketplaceListings(
      FilterRequestModel(direction: _direction, cursor: _cursor, limit: _limit),
    );

    await response.when(
      success: (data) async {
        final allListings = data.data?.listings ?? [];

        final filtered =
            allListings.where((listing) {
              final id =
                  _currentIsCompany
                      ? listing.company?.id
                      : listing.marketer?.id;
              return id == _currentSourceId;
            }).toList();

        if (filtered.isEmpty && allListings.isNotEmpty && autoRetryOnEmpty) {
          _cursor = allListings.last.id ?? _cursor;
          await _fetchListings(); // 👈 recursive call
          return;
        }

        if (filtered.isEmpty || filtered.length < _limit) {
          hasMore = false;
        }

        _cachedListingsBySource[_currentSourceId] ??= [];
        _cachedListingsBySource[_currentSourceId]!.addAll(filtered);

        if (_currentListings.isNotEmpty) {
          _cursor = _currentListings.last.id ?? _cursor;
        }

        debugPrint(
          '📦 Fetched ${filtered.length} listings for '
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

  /// Resets pagination and internal state before loading new data
  void _resetPagination() {
    _cachedListingsBySource[_currentSourceId] = [];
    _cursor = 0;
    hasMore = true;
    isLoading = false;
    _direction = 'next';
  }
}
