import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_request_body.dart';
import 'package:system_pro/features/Authentication/SignUp/data/repo/sign_up_repo.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupRepo) : super(const SignupState.initial()) {
    _startValidationListeners();
  }

  final SignupRepo _signupRepo;

  final formKey = GlobalKey<FormState>();
  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  IconData get passwordVisibilityIcon =>
      _isPasswordVisible ? Icons.visibility : Icons.visibility_off;

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
        confirmPasswordController.text.isNotEmpty;

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(SignupState.signupFormValidityChanged(isValid));
    }
  }

  Future<void> submitIfFormValid() async {
    if (formKey.currentState!.validate()) {
      await _emitSignupStates();
    }
  }

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
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
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
