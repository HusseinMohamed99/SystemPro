import 'package:dio/dio.dart';
import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_request_body.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_response.dart';

class EditProfileRepo {
  EditProfileRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<EditProfileResponse>> editProfile(
  EditProfileRequestBody editProfileRequestBody, 
   ) async {
    try {
      final response = await _apiService.editProfile(editProfileRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
