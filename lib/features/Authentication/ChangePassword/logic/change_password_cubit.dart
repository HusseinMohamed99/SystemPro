import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/model/change_password_request_body.dart';
import 'package:system_pro/features/Authentication/ChangePassword/data/repo/change_password_repo.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_state.dart';

/// Cubit class responsible for handling
///  the change password form state and logic.
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

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  /// Toggles the visibility of the password and updates the icon accordingly.
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

  /// Validates both fields and emits a form validity change state.
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

  /// Submits the change password request if the form is valid.
  Future<void> changePassword({
    required String email,
    required BuildContext context,
  }) async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    final lang = context.localeCode;

    emit(const ChangePasswordState.changePasswordLoading());

    final request = ChangePasswordRequestBody(
      email: email,
      newPassword: newPasswordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );

    final response = await _repo.changePassword(request, lang);

    response.when(
      success: (res) {
        // Clear fields and reset state
        newPasswordController.clear();
        confirmPasswordController.clear();
        _isFormValid = false;
        emit(ChangePasswordState.changePasswordSuccess(res));
        emit(const FormValidationChanged()); // Re-enable button
      },
      failure: (error) {
        emit(
          ChangePasswordState.changePasswordError(
            error: error.apiErrorModel.message ?? 'Something went wrong',
          ),
        );
        emit(const FormValidationChanged()); // Re-enable button on failure
      },
    );
  }

  /// Dispose all controllers and focus nodes when cubit is closed.
  @override
  Future<void> close() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    return super.close();
  }
}
