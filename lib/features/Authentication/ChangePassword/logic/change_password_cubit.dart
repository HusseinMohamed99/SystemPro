import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_request_body.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/repo/change_password_repo.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_state.dart';

/// Handles change password logic and form state management.
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._repo) : super(const ChangePasswordState.initial());

  final ChangePasswordRepo _repo;

  // --- Controllers and Focus Nodes ---
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final FocusNode newPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // --- UI State ---
  bool isPasswordVisible = true;
  IconData visibilityIcon = Icons.visibility_off;

  // Form validation tracking
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  /// Toggles password visibility and updates icon
 void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    visibilityIcon =
        isPasswordVisible ? Icons.visibility_off : Icons.visibility;
    emit(
      ChangePasswordState.passwordVisibilityChanged(
        isPasswordVisible: isPasswordVisible,
        visibilityIcon: visibilityIcon,
      ),
    );
  }


  /// Updates form validation flag and emits if changed
  void updateFormValidationState() {
    final isValid =
        newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        newPasswordController.text == confirmPasswordController.text;

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(const FormValidationChanged());
    }
  }

  /// Submits the change password request
  Future<void> changePassword({required String email}) async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    emit(const ChangePasswordState.changePasswordLoading());

    final request = ChangePasswordRequestBody(
      email: email,
      newPassword: newPasswordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );

    final response = await _repo.changePassword(request);

    response.when(
      success: (res) {
        newPasswordController.clear();
        confirmPasswordController.clear();
        _isFormValid = false;
        emit(ChangePasswordState.changePasswordSuccess(res));
      },
      failure: (error) {
        emit(
          ChangePasswordState.changePasswordError(
            error: error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
      },
    );
  }

  /// Cleans up resources
  @override
  Future<void> close() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    return super.close();
  }
}
