import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Home/data/model/favorites/toggle_favorite_response.dart';
import 'package:system_pro/features/Home/data/model/realestate/filter_request_model.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketplace_response.dart';

/// Repository responsible for handling all marketplace-related requests,
/// such as fetching listings and toggling favorites.
class MarketplaceRepo {
  /// Creates an instance of [MarketplaceRepo] with injected [ApiService].
  MarketplaceRepo(this._apiService);

  final ApiService _apiService;

  /// Fetches marketplace listings with advanced filtering and pagination.
  ///
  /// Returns [ApiResult<MarketplaceResponse>] that includes success or failure.
Future<ApiResult<MarketplaceResponse>> getMarketplaceListings(
    FilterRequestModel filter,
  ) async {
    try {
      final response = await _apiService.getMarketplaceListings(
        filter.toJson(),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }



  /// Toggles the favorite state of a listing by its [id].
  ///
  /// Returns [ToggleFavoriteResponse] wrapped in [ApiResult].
  Future<ApiResult<ToggleFavoriteResponse>> toggleFavorite(int id) async {
    try {
      final response = await _apiService.toggleFavorite(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
