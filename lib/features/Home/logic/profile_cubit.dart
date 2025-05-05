import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/features/Home/data/repos/profile_repo.dart';
import 'package:system_pro/features/Home/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileDataState> {
  ProfileCubit(this._profileRepo) : super(const ProfileDataState.initial());
  final ProfileRepo _profileRepo;
  void emitLogoutStates({required BuildContext context}) async {
    emit(const ProfileDataState.profileDataLoading());
    final response = await _profileRepo.logout();

    await response.when(
      success: (profileDataResponse) async {
        await context.pushNamedAndRemoveUntil(
          Routes.loginView,
          predicate: (Route<dynamic> route) => false,
        );
        await CachingHelper.clearAllSecuredData();
        await CachingHelper.clearAllData();
        emit(ProfileDataState.profileDataSuccess(profileDataResponse));
      },
      failure: (error) {
        emit(
          ProfileDataState.profileDataError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }

  void emitGetProfileStates() async {
    emit(const ProfileDataState.userDataLoading());
    final response = await _profileRepo.getSeekerProfile();
    response.when(
      success: (userDataResponse) {
        emit(ProfileDataState.userDataSuccess(userDataResponse));
      },
      failure: (error) {
        emit(
          ProfileDataState.userDataError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}
