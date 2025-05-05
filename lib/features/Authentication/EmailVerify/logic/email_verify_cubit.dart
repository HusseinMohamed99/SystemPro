import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/repo/email_verify_repo.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';

class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit(this._emailVerifyRepo)
    : super(const EmailVerifyState.initial());
  final EmailVerifyRepo _emailVerifyRepo;

  TextEditingController validationCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitEmailVerifyStates({required String email}) async {
    emit(const EmailVerifyState.emailVerifyLoading());
    final response = await _emailVerifyRepo.emailVerify(
      EmailVerifyRequestBody(otp: validationCodeController.text, email: email),
    );
    response.when(
      success: (emailVerifyResponse) {
        emit(EmailVerifyState.emailVerifySuccess(emailVerifyResponse));
      },
      failure: (error) {
        emit(
          EmailVerifyState.emailVerifyError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }

  void emitResendOtpStates({required String email}) async {
    emit(const EmailVerifyState.resendOtpLoading());
    final response = await _emailVerifyRepo.resendOtp(
      ResendOtpRequestBody(email: email, type: 'register'),
    );
    response.when(
      success: (otpResponse) {
        emit(EmailVerifyState.resendOtpSuccess(otpResponse));
      },
      failure: (error) {
        emit(
          EmailVerifyState.resendOtpError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}
