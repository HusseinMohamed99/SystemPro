import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

/// Represents all possible states for SignupCubit.
/// [T] is the data type returned on successful signup (e.g., SignupResponse).
@freezed
class SignupState<T> with _$SignupState<T> {
  /// Initial/default state
  const factory SignupState.initial() = _Initial;

  /// Emitted while signup request is loading
  const factory SignupState.signupLoading() = SignupLoading;

  /// Emitted when signup is successful with user data
  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;

  /// Emitted when signup fails with a message
  const factory SignupState.signupError({required String error}) = SignupError;

  /// Emitted when form input changes and validity is updated
  const factory SignupState.signupFormValidityChanged(bool isValid) =
      SignupFormValidityChanged;

  /// Emitted when password visibility is toggled
  const factory SignupState.signupPasswordVisibilityChanged(bool isVisible) =
      SignupPasswordVisibilityChanged;

  /// Emitted when reset button is clicked
  const factory SignupState.signupReset() = SignupReset;
}
