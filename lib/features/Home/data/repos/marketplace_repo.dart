import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Home/data/model/favorites/toggle_favorite_response.dart';
import 'package:system_pro/features/Home/data/model/marketplace_response.dart';

class MarketplaceRepo {
  MarketplaceRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<MarketplaceResponse>> getMarketplaceListings() async {
    try {
      final response = await _apiService.getMarketplaceListings();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
Future<ApiResult<ToggleFavoriteResponse>> toggleFavorite(int id) async {
    try {
      final response = await _apiService.toggleFavorite(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }




}
