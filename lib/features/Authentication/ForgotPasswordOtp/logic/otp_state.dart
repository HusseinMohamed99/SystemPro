import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState<T> with _$OtpState<T> {
  /// Initial idle state
  const factory OtpState.initial() = _Initial;

  /// Loading state (for both resend and check OTP)
  const factory OtpState.otpLoading() = OtpLoading;

  /// Success state carrying response data (either resend or check)
  const factory OtpState.otpSuccess(T data) = OtpSuccess<T>;

  /// Error state with a human-readable message

  const factory OtpState.otpError({required String error}) = OtpError;

  const factory OtpState.timerTicking(int secondsRemaining) = TimerTicking;
  const factory OtpState.otpResendAvailable() = OtpResendAvailable;
  const factory OtpState.formValidityChanged(bool isValid) =
      FormValidityChanged;
        /// Emitted when input is completed or cleared.
  const factory OtpState.inputCompletionChanged({
    required bool isCompleted,
  }) = InputCompletionChanged;
}
