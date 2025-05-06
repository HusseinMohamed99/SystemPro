import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/EditProfile/data/model/edit_profile_request_body.dart';
import 'package:system_pro/features/EditProfile/data/repo/edit_profile_repo.dart';
import 'package:system_pro/features/EditProfile/logic/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._editProfileRepo)
    : super(const EditProfileState.initial());

  final EditProfileRepo _editProfileRepo;
  final TextEditingController userNameController = TextEditingController();
  final FocusNode userNameFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> updateUserProfile() async {
    emit(const EditProfileState.editProfileLoading());
    try {
      final requestBody = EditProfileRequestBody(
        userName: userNameController.text,
      );
      final response = await _editProfileRepo.editProfile(requestBody);
      response.when(
        success: (editProfileResponse) {
          emit(EditProfileState.editProfileSuccess(editProfileResponse));
        },
        failure: (error) {
          emit(
            EditProfileState.editProfileError(
              error: error.apiErrorModel.message ?? 'حدث خطأ غير متوقع',
            ),
          );
        },
      );
    } catch (e) {
      emit(EditProfileState.editProfileError(error: e.toString()));
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
