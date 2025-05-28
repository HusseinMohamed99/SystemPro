import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';

@freezed
class ForgotPasswordState<T> with _$ForgotPasswordState<T> {
  const factory ForgotPasswordState.initial() = _Initial;

  const factory ForgotPasswordState.forgotPasswordLoading() =
      ForgotPasswordLoading;
  const factory ForgotPasswordState.forgotPasswordSuccess(T data) =
      ForgotPasswordSuccess<T>;
  const factory ForgotPasswordState.forgotPasswordError({
    required String error,
  }) = ForgotPasswordError;
  const factory ForgotPasswordState.formValidityChanged(bool isValid) =
      FormValidityChanged;
}
