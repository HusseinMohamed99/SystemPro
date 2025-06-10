import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_request_body.dart';
import 'package:system_pro/features/Authentication/SignUp/data/repo/sign_up_repo.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_state.dart';

/// Manages signup form state, validation, and API communication
class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupRepo) : super(const SignupState.initial()) {
    _startValidationListeners();
  }

  final SignupRepo _signupRepo;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  IconData get passwordVisibilityIcon =>
      _isPasswordVisible ? Icons.visibility : Icons.visibility_off;

  /// Toggles password field visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(SignupState.signupPasswordVisibilityChanged(_isPasswordVisible));
  }

  void _startValidationListeners() {
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    final isValid =
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text;

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(SignupState.signupFormValidityChanged(isValid));
    }
  }

  /// Triggers signup only if form is valid
  Future<void> submitIfFormValid() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    await _emitSignupStates();
  }

  Future<void> _emitSignupStates() async {
    emit(const SignupState.signupLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );

    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (error) {
        AppLogs.log(
          'Signup error: ${error.apiErrorModel.message}',
          type: LogType.error,
        );
        emit(
          SignupState.signupError(
            error: error.apiErrorModel.message ?? 'Signup failed',
          ),
        );

        /// Important: Restore form state to allow UI re-enablement
        emit(SignupState.signupFormValidityChanged(_isFormValid));
      },
    );
  }

  void resetForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    _isFormValid = false;
    emit(const SignupState.signupReset());
  }

  @override
  Future<void> close() {
    nameController.removeListener(_validateForm);
    emailController.removeListener(_validateForm);
    passwordController.removeListener(_validateForm);
    confirmPasswordController.removeListener(_validateForm);

    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();

    return super.close();
  }
}
