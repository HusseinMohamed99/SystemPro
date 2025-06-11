import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_request_body.dart';
import 'package:system_pro/features/Home/data/repos/profile_repo.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_state.dart';

class ProfileCubit extends Cubit<ProfileDataState> {
  ProfileCubit(this._profileRepo) : super(const ProfileDataState.initial());
  final ProfileRepo _profileRepo;

  void emitLogoutStates({required BuildContext context}) async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;
    
    final lang = context.localeCode;

    emit(const ProfileDataState.logoutLoading());
    final response = await _profileRepo.logout(lang);
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

  void emitDeleteAccountStates({required BuildContext context}) async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;
    final lang = context.localeCode;

    emit(const ProfileDataState.deleteAccountLoading());
    final response = await _profileRepo.deleteAccount(lang);
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

  void emitGetProfileStates({required BuildContext context}) async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;
    final lang = context.localeCode;

    emit(const ProfileDataState.userDataLoading());
    final response = await _profileRepo.getSeekerProfile(lang);
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

  Future<void> updateUserProfile({required BuildContext context}) async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه بعد
    if (isClosed) return;
    final lang = context.localeCode;

    emit(const ProfileDataState.editProfileLoading());
    try {
      final requestBody = EditProfileRequestBody(
        userName: userNameController.text,
      );
      final response = await _profileRepo.editProfile(requestBody,lang);
      response.when(
        success: (editProfileResponse) {
          // إعادة جلب البيانات بعد التعديل
          emitGetProfileStates(context: context);

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

  bool _hasLoadedOnce = false;

  /// Load user profile data once, only if not loaded before.
  void loadProfileOnce({required BuildContext context}) {
    if (_hasLoadedOnce) return;
    emitGetProfileStates(context: context);
    _hasLoadedOnce = true;
  }

  Future<void> checkSessionValidity({required BuildContext context}) async {
    AppLogs.log('🔍 Checking session validity...');
          final lang = context.localeCode;

    final result = await _profileRepo.getSeekerProfile(lang);

    await result.when(
      success: (_) {},
      failure: (error) async {
        final code = error.apiErrorModel.code;
        if (code == 401 || code == 404) {
          AppLogs.log('🚨 Session expired');
          await logoutLocally();
        }
      },
    );
  }

  Future<void> logoutLocally() async {
    await CachingHelper.clearAllSecuredData();
    await CachingHelper.clearAllData();
    emit(const ProfileDataState.sessionExpired()); // الحالة المخصصة للفصل
  }
}
