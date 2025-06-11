import 'package:system_pro/core/networking/backend/api_error_handler.dart';
import 'package:system_pro/core/networking/backend/api_result.dart';
import 'package:system_pro/core/networking/backend/api_service.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_response.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_response.dart';

/// Repository responsible for handling OTP-related
///  API operations such as check and resend.
final class OtpRepo {
  const OtpRepo(this._apiService);

  final ApiService _apiService;

  /// Sends a request to resend an OTP.
  Future<ApiResult<ResendOtpResponse>> resendOtp(
    ResendOtpRequestBody request,
    String lang,
  ) async {
    try {
      final response = await _apiService.resendOtp(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error,lang));
    }
  }

  /// Sends a request to verify a submitted OTP.
  Future<ApiResult<CheckOtpResponse>> checkOtp(
    CheckOtpRequestBody request,
    String lang,
  ) async {
    try {
      final response = await _apiService.checkOtp(request);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error,lang));
    }
  }
}
