import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_request_body.dart';
import 'package:system_pro/features/Home/data/repos/profile_repo.dart';
import 'package:system_pro/features/Home/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileDataState> {
  ProfileCubit(this._profileRepo) : super(const ProfileDataState.initial());
  final ProfileRepo _profileRepo;

  void emitLogoutStates() async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;

    emit(const ProfileDataState.logoutLoading());
    final response = await _profileRepo.logout();
    await response.when(
      success: (profileDataResponse) async {
        await CachingHelper.clearAllSecuredData();
        await CachingHelper.clearAllData();

        // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
        if (!isClosed) {
          emit(ProfileDataState.logoutSuccess(profileDataResponse));
        }
      },
      failure: (error) {
        // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
        if (!isClosed) {
          emit(
            ProfileDataState.logoutError(
              error: error.apiErrorModel.message ?? '',
            ),
          );
        }
      },
    );
  }

  void emitDeleteAccountStates() async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;

    emit(const ProfileDataState.deleteAccountLoading());
    final response = await _profileRepo.deleteAccount();
    await response.when(
      success: (profileDataResponse) async {
        await CachingHelper.clearAllSecuredData();
        await CachingHelper.clearAllData();

        // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
        if (!isClosed) {
          emit(ProfileDataState.deleteAccountSuccess(profileDataResponse));
        }
      },
      failure: (error) {
        // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
        if (!isClosed) {
          emit(
            ProfileDataState.deleteAccountError(
              error: error.apiErrorModel.message ?? '',
            ),
          );
        }
      },
    );
  }

  void emitGetProfileStates() async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;

    emit(const ProfileDataState.userDataLoading());
    final response = await _profileRepo.getSeekerProfile();
    response.when(
      success: (userDataResponse) {
        // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
        if (!isClosed) {
          emit(ProfileDataState.userDataSuccess(userDataResponse));
        }
      },
      failure: (error) {
        // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
        if (!isClosed) {
          emit(
            ProfileDataState.userDataError(
              error: error.apiErrorModel.message ?? '',
            ),
          );
        }
      },
    );
  }

  final TextEditingController userNameController = TextEditingController();
  final FocusNode userNameFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateUserProfile() async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;

    emit(const ProfileDataState.editProfileLoading());
    try {
      final requestBody = EditProfileRequestBody(
        userName: userNameController.text,
      );
      final response = await _profileRepo.editProfile(requestBody);
      response.when(
        success: (editProfileResponse) {
          // إعادة جلب البيانات بعد التعديل
          emitGetProfileStates();

          // تأكد من عدم إرسال الحالة مرتين أو أكثر
          if (!isClosed) {
            emit(ProfileDataState.editProfileSuccess(editProfileResponse));
          }
        },
        failure: (error) {
          // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
          if (!isClosed) {
            emit(
              ProfileDataState.editProfileError(
                error: error.apiErrorModel.message ?? 'حدث خطأ غير متوقع',
              ),
            );
          }
        },
      );
    } catch (e) {
      // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
      if (!isClosed) {
        emit(ProfileDataState.editProfileError(error: e.toString()));
      }
    }
  }

  void initializeUserName(String userName) {
    if (userNameController.text.trim().isEmpty) {
      userNameController.text = userName;
      userNameController.selection = TextSelection.fromPosition(
        TextPosition(offset: userNameController.text.length),
      );
    }
  }

  @override
  Future<void> close() {
    userNameController.dispose();
    userNameFocusNode.dispose();
    return super.close();
  }
}
