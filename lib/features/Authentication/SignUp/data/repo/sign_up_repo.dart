import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_request_body.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_response.dart';

/// Repository that handles user signup through API interaction.
class SignupRepo {
  SignupRepo(this._apiService);

  final ApiService _apiService;

  /// Sends signup request to the API and returns success or structured failure.
  Future<ApiResult<SignupResponse>> signup(
    SignupRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      // Log error for debugging
      AppLogs.log('Signup error: $error', type: LogType.error);

      // Return wrapped error
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
