import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_response.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_response.dart';

/// Repository responsible for handling email verification and OTP resending.
class EmailVerifyRepo {
  EmailVerifyRepo(this._apiService);
  final ApiService _apiService;

  /// Verifies the email using the provided [EmailVerifyRequestBody]
  Future<ApiResult<EmailVerifyResponse>> verifyEmail(
    EmailVerifyRequestBody request,
    String lang,
  ) async {
    return _handleApiCall(() => _apiService.emailVerify(request), lang);
  }

  /// Resends the OTP to the provided email/phone using [ResendOtpRequestBody]
  Future<ApiResult<ResendOtpResponse>> resendOtp(
    ResendOtpRequestBody request,
    String lang,
  ) async {
    return _handleApiCall(() => _apiService.resendOtp(request), lang);
  }

  /// Shared method to handle API calls and error catching
  Future<ApiResult<T>> _handleApiCall<T>(
    Future<T> Function() apiCall,
    String lang,
  ) async {
    try {
      final response = await apiCall();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error, lang));
    }
  }
}
