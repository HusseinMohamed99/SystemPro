import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_verify_state.freezed.dart';

@freezed
class EmailVerifyState<T> with _$EmailVerifyState<T> {
  const factory EmailVerifyState.initial() = _Initial;

  const factory EmailVerifyState.emailVerifyLoading() = EmailVerifyLoading;
  const factory EmailVerifyState.emailVerifySuccess(T data) =
      EmailVerifySuccess<T>;
  const factory EmailVerifyState.emailVerifyError({required String error}) =
      EmailVerifyError;
}
