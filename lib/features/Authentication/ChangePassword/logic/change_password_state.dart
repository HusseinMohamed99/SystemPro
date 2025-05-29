import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_state.freezed.dart';

/// Represents all possible states of the Change Password flow
@freezed
class ChangePasswordState<T> with _$ChangePasswordState<T> {
  /// Initial state when the user lands on the change password screen
  const factory ChangePasswordState.initial() = _Initial;

  /// Loading state while the password is being changed
  const factory ChangePasswordState.changePasswordLoading() =
      ChangePasswordLoading;

  /// Success state when the password is changed successfully
  const factory ChangePasswordState.changePasswordSuccess(T data) =
      ChangePasswordSuccess<T>;

  /// Error state when password change fails
  const factory ChangePasswordState.changePasswordError({
    required String error,
  }) = ChangePasswordError;

  /// Form validation state update (for enabling/disabling submit button)
  const factory ChangePasswordState.formValidationChanged() =
      FormValidationChanged;
  const factory ChangePasswordState.passwordVisibilityChanged({
    required bool isPasswordVisible,
    required IconData visibilityIcon,
  }) = PasswordVisibilityChanged;
}
