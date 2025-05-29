import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/repo/email_verify_repo.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';

/// Cubit responsible for handling email verification, resend logic, and UI states.
class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit(this._emailVerifyRepo)
    : super(const EmailVerifyState.initial());

  final EmailVerifyRepo _emailVerifyRepo;

  final TextEditingController validationCodeController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Timer? _timer;
  int _secondsLeft = 59;

  bool get canResend => _secondsLeft == 0;
  int get secondsLeft => _secondsLeft;

  /// Starts the countdown timer for resend OTP
void startTimer() {
    if (_timer != null && _timer!.isActive) return;

    _secondsLeft = 59;
    emit(EmailVerifyState.timerTicking(_secondsLeft));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsLeft--;
      if (_secondsLeft <= 0) {
        timer.cancel();
        _timer = null;
        emit(const EmailVerifyState.timerExpired());
      } else {
        emit(EmailVerifyState.timerTicking(_secondsLeft));
      }
    });
  }


  // Marks the completion status of the OTP input.
  bool _isCompleted = false;
  bool get isCompleted => _isCompleted;

  void markOtpCompletion(bool value) {
    _isCompleted = value;
    emit(EmailVerifyState.inputCompletionChanged(isCompleted: value));
  }

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
    if (_secondsLeft > 0) return; // 🚫 Don't resend until timer hits 0

    emit(const EmailVerifyState.resendOtpLoading());

    final response = await _emailVerifyRepo.resendOtp(
      ResendOtpRequestBody(email: email, type: 'register'),
    );

    response.when(
      success: (data) {
        emit(EmailVerifyState.resendOtpSuccess(data));
        startTimer(); // Start again after successful resend
      },
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
    _timer?.cancel();
    validationCodeController.dispose();
    return super.close();
  }
}
