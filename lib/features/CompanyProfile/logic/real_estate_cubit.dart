import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/features/CompanyProfile/logic/real_estate_state.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/data/repos/marketplace_repo.dart';

/// Cache object to store listings and cursor per source ID
class _CachedData {
  List<Listing> listings = [];
  DateTime lastUpdated = DateTime.now();
  int cursor = 0;
}

/// Cubit responsible for fetching, caching, and paginating real estate listings
/// based on companyId or marketerId.
/// Supports HydratedBloc for offline persistence.
class RealEstateCubit extends HydratedCubit<RealEstateState> {
  RealEstateCubit(this._marketplaceRepo)
    : super(const RealEstateState.initial());

  final MarketplaceRepo _marketplaceRepo;

  final Map<int, _CachedData> _cachedListingsBySource = {};
  int _currentSourceId = 0;
  bool _currentIsCompany = false;
  final int _limit = 5;
  bool isLoading = false;
  bool hasMore = true;
  int _apiCallCount = 0;

  List<Listing> get _currentListings =>
      _cachedListingsBySource[_currentSourceId]?.listings ?? [];
  int get apiCallCount => _apiCallCount;

  /// Load listings by source (companyId or marketerId)
  Future<void> getListingsBySource({
    int? companyId,
    int? marketerId,
    required BuildContext context,
  }) async {
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
      emit(RealEstateState.filtered(cache.listings));
      return;
    }

    _currentSourceId = sourceId;
    _currentIsCompany = isCompany;
    _resetPagination();
    final lang = context.localeCode;
    emit(const RealEstateState.loading());
    await _fetchListings(lang: lang);
  }

  /// Load more listings (pagination)
  Future<void> loadMoreListingsBySource({required String lang}) async {
    if (isLoading || !hasMore) return;
    emit(RealEstateState.loadingMore(_currentListings));
    await _fetchListings(lang: lang);
  }

  /// Retry last failed request
  Future<void> retry({required String lang}) async {
    await _fetchListings(lang: lang);
  }

  /// Fetch listings from backend and update cache/state
  Future<void> _fetchListings({required String lang}) async {
    isLoading = true;
    _apiCallCount++;

    final sourceId = _currentSourceId;
    final isCompany = _currentIsCompany;
    final cache = _cachedListingsBySource[sourceId] ??= _CachedData();

    final response = await _marketplaceRepo.getMarketplaceListings(
      FilterRequestModel(
        cursor: cache.cursor,
        limit: _limit,
        companyId: isCompany ? sourceId : null,
        marketerId: !isCompany ? sourceId : null,
      ),
      lang,
    );

    response.when(
      success: (data) {
        final listings = data.data?.listings ?? [];
        if (listings.isEmpty) {
          hasMore = false;
        } else {
          final lastId = listings.last.id;
          if (lastId != null && lastId != cache.cursor) {
            cache.cursor = lastId;
          } else {
            hasMore = false;
          }
        }

        cache.listings.addAll(listings);
        cache.lastUpdated = DateTime.now();

        emit(RealEstateState.filtered(List.from(cache.listings)));
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
    hasMore = true;
    isLoading = false;
  }

  /// Save cubit state to local storage (hydrated)
  @override
  Map<String, dynamic>? toJson(RealEstateState state) {
    if (state is FilteredListingsSuccess) {
      return {
        'sourceId': _currentSourceId,
        'isCompany': _currentIsCompany,
        'cached': _cachedListingsBySource.map(
          (key, value) => MapEntry(key.toString(), {
            'listings': value.listings.map((e) => e.toJson()).toList(),
            'lastUpdated': value.lastUpdated.toIso8601String(),
            'cursor': value.cursor,
          }),
        ),
      };
    }
    return null;
  }

  /// Restore cubit state from local storage (hydrated)
  @override
  RealEstateState? fromJson(Map<String, dynamic> json) {
    try {
      final Map<int, _CachedData> restoredCache = {};
      final cached = json['cached'] as Map<String, dynamic>;

      cached.forEach((key, value) {
        restoredCache[int.parse(key)] =
            _CachedData()
              ..listings =
                  (value['listings'] as List)
                      .map((e) => Listing.fromJson(e))
                      .toList()
              ..lastUpdated = DateTime.parse(value['lastUpdated'])
              ..cursor = value['cursor'] ?? 0;
      });

      _cachedListingsBySource.clear();
      _cachedListingsBySource.addAll(restoredCache);
      _currentSourceId = json['sourceId'];
      _currentIsCompany = json['isCompany'];

      return RealEstateState.filtered(
        _cachedListingsBySource[_currentSourceId]?.listings ?? [],
      );
    } catch (_) {
      return const RealEstateState.initial();
    }
  }
}
