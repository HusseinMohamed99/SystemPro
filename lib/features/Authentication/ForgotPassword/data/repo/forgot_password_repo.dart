import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_response.dart';

/// Repository responsible for handling the Forgot Password API interaction.
class ForgotPasswordRepo {
  const ForgotPasswordRepo(this._apiService);

  final ApiService _apiService;

  /// Sends a forgot password request to the server.
  ///
  /// Returns [ApiResult.success] with [ForgotPasswordResponse] on success,
  /// or [ApiResult.failure] with error details if an exception occurs.
  Future<ApiResult<ForgotPasswordResponse>> forgotPassword(
    ForgotPasswordRequestBody requestBody,
    String lang,
  ) async {
    try {
      final response = await _apiService.forgotPassword(requestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error,lang));
    }
  }
}
