import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';

import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_request_body.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_response.dart';

/// Repository responsible for handling password change logic.
/// This class separates data layer from the UI/business logic.
class ChangePasswordRepo {
  ChangePasswordRepo(this._apiService);

  final ApiService _apiService;

  /// Attempts to change the user's password using the provided request body.
  /// Returns either a successful response or an error wrapped in ApiResult.
  Future<ApiResult<ChangePasswordResponse>> changePassword(
    ChangePasswordRequestBody request,
  ) async {
    try {
      final response = await _apiService.changePassword(request);
      return ApiResult.success(response);
    } catch (error) {
      // Catch and map the error using a global handler
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
