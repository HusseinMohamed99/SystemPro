import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/core/networking/backend/api_success_model.dart';
import 'package:system_pro/features/Home/data/model/user/user_data_response.dart';

class ProfileRepo {

  ProfileRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<ApiSuccessModel>> logout() async {
    try {
      final response = await _apiService.logout();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
  Future<ApiResult<UserDataResponse>> getSeekerProfile() async {
    try {
      final response = await _apiService.getUserData();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
