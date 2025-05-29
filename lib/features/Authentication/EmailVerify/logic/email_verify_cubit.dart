import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/repo/email_verify_repo.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';

/// Cubit responsible for handling email verification and OTP resending logic.
class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit(this._emailVerifyRepo)
    : super(const EmailVerifyState.initial());

  final EmailVerifyRepo _emailVerifyRepo;

  final TextEditingController validationCodeController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Verifies the email using the OTP entered by the user.
  Future<void> verifyEmail({required String email}) async {
    emit(const EmailVerifyState.emailVerifyLoading());

    final response = await _emailVerifyRepo.verifyEmail(
      EmailVerifyRequestBody(
        otp: validationCodeController.text.trim(),
        email: email,
      ),
    );

    response.when(
      success: (data) => emit(EmailVerifyState.emailVerifySuccess(data)),
      failure:
          (error) => emit(
            EmailVerifyState.emailVerifyError(
              error: error.apiErrorModel.message ?? 'Verification failed',
            ),
          ),
    );
  }

  /// Resends the OTP to the given email.
  Future<void> resendOtp({required String email}) async {
    emit(const EmailVerifyState.resendOtpLoading());

    final response = await _emailVerifyRepo.resendOtp(
      ResendOtpRequestBody(email: email, type: 'register'),
    );

    response.when(
      success: (data) => emit(EmailVerifyState.resendOtpSuccess(data)),
      failure:
          (error) => emit(
            EmailVerifyState.resendOtpError(
              error: error.apiErrorModel.message ?? 'Failed to resend code',
            ),
          ),
    );
  }

  @override
  Future<void> close() {
    validationCodeController.dispose();
    return super.close();
  }
}
