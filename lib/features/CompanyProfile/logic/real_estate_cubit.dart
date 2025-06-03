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

  /// تحميل أول مجموعة بيانات
  Future<void> getListingsBySource({int? companyId, int? marketerId}) async {
    final int? sourceId = companyId ?? marketerId;
    final bool isCompany = companyId != null;

    if (sourceId == null) {
      emit(const RealEstateState.error('Missing companyId or marketerId'));
      return;
    }

    // تجاهل إعادة التحميل إذا كانت البيانات بالفعل موجودة
    if (_currentSourceId == sourceId &&
        _currentIsCompany == isCompany &&
        _cachedListingsBySource[sourceId]?.isNotEmpty == true) {
      return;
    }

    _currentSourceId = sourceId;
    _currentIsCompany = isCompany;
    _resetPagination();

    emit(const RealEstateState.loading());
    await _fetchListings();
  }

  /// تحميل الصفحة التالية من البيانات
  Future<void> loadMoreListingsBySource() async {
    if (isLoading || !hasMore) return;
    emit(RealEstateState.loadingMore(_currentListings));
    await _fetchListings();
  }

  /// جلب البيانات من الـ API وتحديث الكاش
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

        if (listings.isEmpty || listings.length < _limit) {
          hasMore = false;
        }

        _cachedListingsBySource[sourceId] ??= [];
        _cachedListingsBySource[sourceId]!.addAll(listings);

        if (_cachedListingsBySource[sourceId]!.isNotEmpty) {
          final lastId = _cachedListingsBySource[sourceId]!.last.id;
          if (lastId != null && lastId != _cursor) {
            _cursor = lastId;
          }
        }
        emit(
          RealEstateState.filtered(
            List.from(_cachedListingsBySource[sourceId]!),
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

  /// إعادة تعيين بيانات التصفح
  void _resetPagination() {
    _cachedListingsBySource[_currentSourceId] = [];
    _cursor = 0;
    hasMore = true;
    isLoading = false;
    _direction = 'next';
  }
}
