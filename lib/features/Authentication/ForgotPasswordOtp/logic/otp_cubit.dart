import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/repo/otp_repo.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_state.dart';

/// Manages Forgot Password OTP logic, including timer, resend, and validation.
class OtpCubit extends Cubit<OtpState> {
  OtpCubit(this._otpRepo) : super(const OtpState.initial());

  final OtpRepo _otpRepo;

  final TextEditingController validationCodeController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Timer? _timer;
  int _secondsRemaining = 59;
  bool _isCompleted = false;

  bool get canResend => _secondsRemaining == 0;
  int get secondsLeft => _secondsRemaining;
  bool get isCompleted => _isCompleted;

  /// Starts the resend cooldown timer
  void startTimer() {
    if (_timer?.isActive ?? false) return;

    _secondsRemaining = 59;
    emit(OtpState.timerTicking(_secondsRemaining));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _secondsRemaining--;

      if (_secondsRemaining <= 0) {
        timer.cancel();
        _timer = null;
        emit(const OtpState.otpResendAvailable());
      } else {
        emit(OtpState.timerTicking(_secondsRemaining));
      }
    });
  }

  /// Called once after screen loads to avoid re-triggering the timer
  void startTimerIfNeeded() {
    if (_secondsRemaining == 59 && !(_timer?.isActive ?? false)) {
      startTimer();
    }
  }

  /// Updates internal state when OTP is fully entered
  void markOtpCompletion(bool value) {
    if (_isCompleted == value) return;
    _isCompleted = value;
    emit(OtpState.inputCompletionChanged(isCompleted: _isCompleted));
  }

  /// Verifies OTP with backend
  Future<void> checkOtp(CheckOtpRequestBody request) async {
    emit(const OtpState.otpLoading());

    final response = await _otpRepo.checkOtp(request);

    response.when(
      success: (data) {
        emit(OtpState.otpSuccess(data));
      },
      failure: (error) {
        emit(
          OtpState.otpError(
            error: error.apiErrorModel.message ?? 'Verification failed',
          ),
        );
        // إعادة تفعيل الزر بعد الفشل
        emit(OtpState.inputCompletionChanged(isCompleted: _isCompleted));
      },
    );
  }

  /// Resends OTP and restarts timer if allowed
  Future<void> resendOtp(ResendOtpRequestBody request) async {
    if (_secondsRemaining > 0) return;

    emit(const OtpState.otpLoading());

    final response = await _otpRepo.resendOtp(request);

    response.when(
      success: (data) {
        emit(OtpState.otpSuccess(data)); // تم التبديل لحالة مستقلة
        startTimer(); // Restart timer
      },
      failure: (error) {
        emit(
          OtpState.otpError(
            error: error.apiErrorModel.message ?? 'Failed to resend code',
          ),
        );
        // تأكيد أنه يمكن تفعيل زر الإرسال مرة أخرى
        emit(const OtpState.otpResendAvailable());
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
