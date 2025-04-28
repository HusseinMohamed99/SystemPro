import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_request_body.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/repo/change_password_repo.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._changePasswordRepo)
    : super(const ChangePasswordState.initial());
  final ChangePasswordRepo _changePasswordRepo;


  final TextEditingController newPasswordController = TextEditingController();
  final FocusNode newPasswordFocusNode = FocusNode();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final FocusNode confirmNewPasswordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Change Password
  void emitChangePasswordStates() async {
    emit(const ChangePasswordState.changePasswordLoading());
    final response = await _changePasswordRepo.changePassword(
      ChangePasswordRequestBody(
        confirmPassword: confirmNewPasswordController.text,
        newPassword: newPasswordController.text,
      ),
    );
    response.when(
      success: (changePasswordResponse) {
        confirmNewPasswordController.clear;
        newPasswordController.clear;

        emit(ChangePasswordState.changePasswordSuccess(changePasswordResponse));
      },
      failure: (error) {
        emit(
          ChangePasswordState.changePasswordError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}
