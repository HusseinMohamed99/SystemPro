import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_request_body.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_response.dart';

/// Handles login requests and error mapping using the ApiService layer.
class LoginRepo {
  LoginRepo(this._apiService);

  final ApiService _apiService;

  /// Calls the login API and returns either success or failure result.
  /// Returns [ApiResult.success] if successful, otherwise [ApiResult.failure].
  Future<ApiResult<LoginResponse>> login(LoginRequestBody request) async {
    try {
      // Call login API through the API service
      final response = await _apiService.login(request);
      return ApiResult.success(response);
    } catch (error) {
   
      // Map and return a structured error
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
