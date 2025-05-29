import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verify_state.freezed.dart';

/// Defines all possible states for email verification and OTP resending logic.
@freezed
class EmailVerifyState<T> with _$EmailVerifyState<T> {
  /// Initial state when the screen is first loaded.
  const factory EmailVerifyState.initial() = _Initial;

  // ====================== Email Verification ======================

  /// Emitted while verifying email with OTP.
  const factory EmailVerifyState.emailVerifyLoading() = EmailVerifyLoading;

  /// Emitted when email verification succeeds.
  const factory EmailVerifyState.emailVerifySuccess(T data) =
      EmailVerifySuccess<T>;

  /// Emitted when email verification fails.
  const factory EmailVerifyState.emailVerifyError({required String error}) =
      EmailVerifyError;

  // ====================== OTP Resend ======================

  /// Emitted while resending the OTP.
  const factory EmailVerifyState.resendOtpLoading() = ResendOtpLoading;

  /// Emitted when OTP is successfully resent.
  const factory EmailVerifyState.resendOtpSuccess(T data) = ResendOtpSuccess<T>;

  /// Emitted when resending the OTP fails.
  const factory EmailVerifyState.resendOtpError({required String error}) =
      ResendOtpError;

  // ====================== UI-Related States ======================

  /// Emitted on every second during countdown.
  const factory EmailVerifyState.timerTicking(int secondsLeft) = TimerTicking;

  /// Emitted when countdown timer reaches 0.
  const factory EmailVerifyState.timerExpired() = TimerExpired;

  /// Emitted when input is completed or cleared.
  const factory EmailVerifyState.inputCompletionChanged({
    required bool isCompleted,
  }) = InputCompletionChanged;
}
