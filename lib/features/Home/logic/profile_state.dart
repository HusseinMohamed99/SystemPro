import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileDataState<T> with _$ProfileDataState<T> {
  const factory ProfileDataState.initial() = _Initial;

  const factory ProfileDataState.profileDataLoading() = ProfileDataLoading;
  const factory ProfileDataState.profileDataSuccess(T data) =
      ProfileDataSuccess<T>;
  const factory ProfileDataState.profileDataError({required String error}) =
      ProfileDataError;
  const factory ProfileDataState.userDataLoading() = UserDataLoading;
  const factory ProfileDataState.userDataSuccess(T data) = UserDataSuccess<T>;
  const factory ProfileDataState.userDataError({required String error}) =
      UserDataError;
}
