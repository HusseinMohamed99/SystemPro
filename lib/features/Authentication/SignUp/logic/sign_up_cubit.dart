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

  // Form and input controllers
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Focus management
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  // State: Form validation
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  // State: Password visibility
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  IconData get passwordVisibilityIcon =>
      _isPasswordVisible ? Icons.visibility : Icons.visibility_off;

  /// Toggle visibility for password field
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(SignupState.signupPasswordVisibilityChanged(_isPasswordVisible));
  }

  /// Start listening to input changes to validate the form
  void _startValidationListeners() {
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  /// Validate that all fields are non-empty (and optionally password match)
  void _validateForm() {
    final isValid =
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(SignupState.signupFormValidityChanged(isValid));
    }
  }

  /// Trigger signup only if form is valid
  Future<void> submitIfFormValid() async {
    if (formKey.currentState?.validate() ?? false) {
      await _emitSignupStates();
    }
  }

  /// Send signup request and emit appropriate states
  Future<void> _emitSignupStates() async {
    emit(const SignupState.signupLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
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
      },
    );
  }

  /// Optional: Reset the form values
  void resetForm() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    _isFormValid = false;
    emit(const SignupState.signupReset());
  }

  /// Clean up resources when cubit is closed
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
