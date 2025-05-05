import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_response.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_response.dart';

class EmailVerifyRepo {
  EmailVerifyRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<EmailVerifyResponse>> emailVerify(
    EmailVerifyRequestBody emailVerifyRequestBody,
  ) async {
    try {
      final response = await _apiService.emailVerify(emailVerifyRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ResendOtpResponse>> resendOtp(
    ResendOtpRequestBody resendOtpRequestBody,
  ) async {
    try {
      final response = await _apiService.resendOtp(resendOtpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
