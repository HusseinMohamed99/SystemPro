import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/model/email_verify_request_body.dart';
import 'package:system_pro/features/Authentication/EmailVerify/data/repo/email_verify_repo.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';

/// Manages email verification logic, OTP validation, and resend logic.
class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit(this._emailVerifyRepo)
    : super(const EmailVerifyState.initial());

  final EmailVerifyRepo _emailVerifyRepo;

  /// Used by the form to access the OTP input.
  final TextEditingController validationCodeController =
      TextEditingController();

  /// Used for validating the form.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Internal state: countdown timer
  Timer? _timer;
  int _secondsLeft = 59;

  // State: whether user has entered a valid OTP code (UI use)
  bool _isCompleted = false;

  /// Returns whether the user can resend the OTP
  bool get canResend => _secondsLeft == 0;

  /// Returns the current remaining seconds for the timer
  int get secondsLeft => _secondsLeft;

  /// Returns whether the OTP input is marked as completed
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

  /// Starts timer if not already active (used in post-frame callback)
  void startTimerIfNeeded() {
    if (_secondsLeft == 59 && !(_timer?.isActive ?? false)) {
      startTimer();
    }
  }

  /// Called by OTP input field on completion (length == 4)
  void markOtpCompletion(bool value) {
    if (_isCompleted == value) return;
    _isCompleted = value;
    emit(EmailVerifyState.inputCompletionChanged(isCompleted: _isCompleted));
  }

  /// Validates OTP and sends verification request
  Future<void> verifyEmail({required String email}) async {
    emit(const EmailVerifyState.emailVerifyLoading());

    final otp = validationCodeController.text.trim();

    final response = await _emailVerifyRepo.verifyEmail(
      EmailVerifyRequestBody(email: email, otp: otp),
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
      },
    );
  }

  /// Sends a new OTP to the user, if cooldown has expired
  Future<void> resendOtp({required String email}) async {
    if (_secondsLeft > 0) return;

    emit(const EmailVerifyState.resendOtpLoading());

    final response = await _emailVerifyRepo.resendOtp(
      ResendOtpRequestBody(email: email, type: 'register'),
    );

    response.when(
      success: (data) {
        emit(EmailVerifyState.resendOtpSuccess(data));
        startTimer(); // Restart timer after resend
      },
      failure: (error) {
        emit(
          EmailVerifyState.resendOtpError(
            error: error.apiErrorModel.message ?? 'Failed to resend code',
          ),
        );
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
