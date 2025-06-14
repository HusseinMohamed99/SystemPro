import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/core/networking/backend/api_success_model.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_request_body.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_response.dart';
import 'package:system_pro/features/Home/data/model/user/user_data_response.dart';

class ProfileRepo {
  ProfileRepo(this._apiService, this._authLocalService);
  final ApiService _apiService;
  final AuthLocalService _authLocalService;

  Future<ApiResult<ApiSuccessModel>> logout(String lang) async {
    try {
      final response = await _apiService.logout();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error,lang));
    }
  }

  Future<ApiResult<ApiSuccessModel>> deleteAccount(String lang) async {
    try {
      final response = await _apiService.deleteAccount();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error,lang));
    }
  }

  Future<ApiResult<UserDataResponse>> getSeekerProfile(String lang) async {
    try {
      final response = await _apiService.getUserData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error,lang));
    }
  }

  Future<ApiResult<EditProfileResponse>> editProfile(
    EditProfileRequestBody editProfileRequestBody,
    String lang
  ) async {
    try {
      final response = await _apiService.editProfile(editProfileRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error,lang));
    }
  }

  /// Clear token or session locally (for session expiration cases)
  Future<void> clearToken() async {
    await _authLocalService
        .removeToken(); // نفترض أنك تستخدم SharedPreferences أو SecureStorage
  }
}
