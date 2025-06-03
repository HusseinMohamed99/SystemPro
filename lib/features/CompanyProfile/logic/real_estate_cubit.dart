import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';

/// Cubit responsible for fetching and paginating real estate listings
/// filtered by companyId or marketerId.
class RealEstateCubit extends Cubit<RealEstateState> {
  RealEstateCubit(this._marketplaceRepo)
    : super(const RealEstateState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final Map<int, _CachedData> _cachedListingsBySource = {};
  int _cursor = 0;
  bool isLoading = false;
  bool hasMore = true;
  final int _limit = 5;
  String _direction = 'next';
  int _currentSourceId = 0;
  bool _currentIsCompany = false;
  int _apiCallCount = 0;

  List<Listing> get _currentListings =>
      _cachedListingsBySource[_currentSourceId]?.listings ?? [];

  int get apiCallCount => _apiCallCount;

  Future<void> getListingsBySource({int? companyId, int? marketerId}) async {
    final int? sourceId = companyId ?? marketerId;
    final bool isCompany = companyId != null;

    if (sourceId == null) {
      emit(const RealEstateState.error('Missing companyId or marketerId'));
      return;
    }

    final cache = _cachedListingsBySource[sourceId];
    final now = DateTime.now();

    if (_currentSourceId == sourceId &&
        _currentIsCompany == isCompany &&
        cache != null &&
        cache.listings.isNotEmpty &&
        now.difference(cache.lastUpdated).inMinutes < 10) {
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

  Future<void> retry() async {
    await _fetchListings();
  }

  Future<void> _fetchListings() async {
    isLoading = true;
    _apiCallCount++;

    final sourceId = _currentSourceId;
    final isCompany = _currentIsCompany;

    debugPrint('📡 API Call #$_apiCallCount for source $sourceId');

    final response = await _marketplaceRepo.getMarketplaceListings(
      FilterRequestModel(
        direction: _direction,
        cursor: _cursor,
        limit: _limit,
        companyId: isCompany ? sourceId : null,
        marketerId: !isCompany ? sourceId : null,
      ),
    );

    AppLogs.log(isCompany ? 'Company $sourceId' : 'Marketer $sourceId');

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];

        listings.sort(
          (a, b) => DateTime.parse(
            b.createdAt ?? '',
          ).compareTo(DateTime.parse(a.createdAt ?? '')),
        );

        _cachedListingsBySource[sourceId] ??= _CachedData();

        final existingIds =
            _cachedListingsBySource[sourceId]!.listings
                .map((e) => e.id)
                .toSet();
        final newListings =
            listings.where((e) => !existingIds.contains(e.id)).toList();

        if (newListings.isEmpty || newListings.length < _limit) {
          hasMore = false;
        }

        _cachedListingsBySource[sourceId]!.listings.addAll(newListings);
        _cachedListingsBySource[sourceId]!.lastUpdated = DateTime.now();

        final lastId = newListings.lastOrNull?.id;
        if (lastId != null && lastId != _cursor) {
          _cursor = lastId;
        } else {
          hasMore = false;
        }

        emit(
          RealEstateState.filtered(
            List.from(_cachedListingsBySource[sourceId]!.listings),
          ),
        );
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
    _cachedListingsBySource[_currentSourceId] = _CachedData();
    _cursor = 0;
    hasMore = true;
    isLoading = false;
    _direction = 'next';
  }
}

class _CachedData {
  List<Listing> listings = [];
  DateTime lastUpdated = DateTime.now();
}

extension NullableLast<T> on List<T> {
  T? get lastOrNull => isEmpty ? null : last;
}
