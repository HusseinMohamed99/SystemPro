import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

/// Represents all possible states of the Forgot Password process
@freezed
class ForgotPasswordState<T> with _$ForgotPasswordState<T> {
  /// Initial (idle) state
  const factory ForgotPasswordState.initial() = _Initial;

  /// Loading state when request is being processed
  const factory ForgotPasswordState.forgotPasswordLoading() =
      ForgotPasswordLoading;

  /// Success state with generic response data
  const factory ForgotPasswordState.forgotPasswordSuccess(T data) =
      ForgotPasswordSuccess<T>;

  /// Error state with message
  const factory ForgotPasswordState.forgotPasswordError({
    required String error,
  }) = ForgotPasswordError;

  /// Emits when the email form field becomes valid/invalid
  const factory ForgotPasswordState.forgotPasswordFormValidityChanged(
    bool isValid,
  ) = ForgotPasswordFormValidityChanged;
}
