import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileDataState<T> with _$ProfileDataState<T> {
  const factory ProfileDataState.initial() = _Initial;

  const factory ProfileDataState.logoutLoading() = LogoutLoading;
  const factory ProfileDataState.logoutSuccess(T data) = LogoutSuccess<T>;
  const factory ProfileDataState.logoutError({required String error}) =
      LogoutError;
  const factory ProfileDataState.userDataLoading() = UserDataLoading;
  const factory ProfileDataState.userDataSuccess(T data) = UserDataSuccess<T>;
  const factory ProfileDataState.userDataError({required String error}) =
      UserDataError;
  const factory ProfileDataState.editProfileLoading() = EditProfileLoading;
  const factory ProfileDataState.editProfileSuccess(T data) =
      EditProfileSuccess<T>;
  const factory ProfileDataState.editProfileError({required String error}) =
      EditProfileError;
}
