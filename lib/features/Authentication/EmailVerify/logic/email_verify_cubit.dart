import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/repo/email_verify_repo.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';

/// Manages email verification logic, OTP validation, and resend logic.
class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit(this._emailVerifyRepo)
    : super(const EmailVerifyState.initial());

  final EmailVerifyRepo _emailVerifyRepo;

  final TextEditingController validationCodeController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Timer? _timer;
  int _secondsLeft = 59;
  bool _isCompleted = false;

  bool get canResend => _secondsLeft == 0;
  int get secondsLeft => _secondsLeft;
  bool get isCompleted => _isCompleted;

  /// Starts a 59-second countdown timer and emits ticks each second.
  void startTimer() {
    if (_timer?.isActive ?? false) return;

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

  void startTimerIfNeeded() {
    if (_secondsLeft == 59 && !(_timer?.isActive ?? false)) {
      startTimer();
    }
  }

  /// Called when the OTP input field changes (length == 4)
  void markOtpCompletion(bool value) {
    if (_isCompleted == value) return;
    _isCompleted = value;
    emit(EmailVerifyState.inputCompletionChanged(isCompleted: _isCompleted));
  }

  /// Validates OTP and triggers verification logic
  Future<void> verifyEmail({required String email, required BuildContext context}) async {
        final lang = context.localeCode;

    emit(const EmailVerifyState.emailVerifyLoading());

    final otp = validationCodeController.text.trim();

    final response = await _emailVerifyRepo.verifyEmail(
      EmailVerifyRequestBody(email: email, otp: otp),
      lang,
    );

    response.when(
      success: (data) {
        emit(EmailVerifyState.emailVerifySuccess(data));
      },
      failure: (error) {
        emit(
          EmailVerifyState.emailVerifyError(
            error: error.apiErrorModel.message ?? 'Verification failed',
          ),
        );

        // إعادة الحالة لتفعيل الزر مرة أخرى
        emit(
          EmailVerifyState.inputCompletionChanged(isCompleted: _isCompleted),
        );
      },
    );
  }

  /// Sends a new OTP if cooldown expired
  Future<void> resendOtp({required String email, required BuildContext context}) async {
    if (_secondsLeft > 0) return;
    final lang = context.localeCode;

    emit(const EmailVerifyState.resendOtpLoading());

    final response = await _emailVerifyRepo.resendOtp(
      ResendOtpRequestBody(email: email, type: 'register'),
      lang,
    );

    response.when(
      success: (data) {
        emit(EmailVerifyState.resendOtpSuccess(data));
        startTimer(); // Start new timer after resend
      },
      failure: (error) {
        emit(
          EmailVerifyState.resendOtpError(
            error: error.apiErrorModel.message ?? 'Failed to resend code',
          ),
        );

        // إعادة تمكين الزر بعد الفشل
        emit(const EmailVerifyState.timerExpired());
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    validationCodeController.dispose();
    return super.close();
  }
}
