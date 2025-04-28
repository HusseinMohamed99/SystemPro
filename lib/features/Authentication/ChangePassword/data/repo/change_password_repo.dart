import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_request_body.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_response.dart';

class ChangePasswordRepo {

  ChangePasswordRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<ChangePasswordResponse>> changePassword(
    ChangePasswordRequestBody changePasswordRequestBody,
  ) async {
    try {
      final response = await _apiService.changePassword(
        changePasswordRequestBody,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
