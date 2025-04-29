import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_state.freezed.dart';

@freezed
class EditProfileState<T> with _$EditProfileState<T> {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.editProfileLoading() = EditProfileLoading;
  const factory EditProfileState.editProfileSuccess(T data) =
      EditProfileSuccess<T>;
  const factory EditProfileState.editProfileError({required String error}) =
      EditProfileError;
}
