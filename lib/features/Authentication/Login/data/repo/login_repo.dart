import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
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
  Future<ApiResult<LoginResponse>> login(LoginRequestBody request) async {
    try {
      final response = await _apiService.login(request);
      return ApiResult.success(response);
    } catch (error, stackTrace) {
      // You can log the error or stack trace here for debugging
      AppLogs.log('Login error: $error\n$stackTrace', type: LogType.error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
