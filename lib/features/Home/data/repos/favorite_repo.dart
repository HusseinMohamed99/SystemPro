import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Home/data/model/favorites/get_favorites_response.dart';
import 'package:system_pro/features/Home/data/model/favorites/toggle_favorite_response.dart';

class FavoriteRepo {
  FavoriteRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<GetFavoritesResponse>> getFavoriteListings(
    String lang,
  ) async {
    try {
      final response = await _apiService.getFavoriteListings();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error, lang));
    }
  }

  Future<ApiResult<ToggleFavoriteResponse>> toggleFavorite(
    int id,
    String lang,
  ) async {
    try {
      final response = await _apiService.toggleFavorite(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error, lang));
    }
  }
}
