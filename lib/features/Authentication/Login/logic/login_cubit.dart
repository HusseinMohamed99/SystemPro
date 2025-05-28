import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/networking/backend/dio_factory.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_request_body.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_response.dart';
import 'package:system_pro/features/Authentication/Login/data/repo/login_repo.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial()) {
    _startValidationListeners();
  }

  final LoginRepo _loginRepo;

  // Form fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  // Track form validity to control button enabling/disabling
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  // Used to show/hide password text
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;
  IconData get passwordVisibilityIcon =>
      _isPasswordVisible ? Icons.visibility : Icons.visibility_off;

  // Toggle visibility of password field
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(LoginState.passwordVisibilityChanged(_isPasswordVisible));
  }

  // Listen to changes in form fields to update form validity
  void _startValidationListeners() {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  // Stop listening when widget is disposed
  void _stopValidationListeners() {
    emailController.removeListener(_validateForm);
    passwordController.removeListener(_validateForm);
  }

  // Validate that both fields are non-empty
  void _validateForm() {
    final isValid =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(LoginState.formValidityChanged(isValid));
    }
  }

  // Perform login only if form is valid
  void submitIfFormValid() {
    if (formKey.currentState?.validate() ?? false) {
      _performLogin();
    }
  }

  // Main login logic
  Future<void> _performLogin() async {
    emit(const LoginState.loginLoading());

    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    await response.when(
      success: (loginResponse) async {
        await _cacheUserData(loginResponse);
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (error) {
        emit(
          LoginState.loginError(
            error: error.apiErrorModel.message ?? 'Login failed',
          ),
        );
      },
    );
  }

  // Save token and inject into Dio headers
  Future<void> _saveUserToken(String token) async {
    await CachingHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  // Save token + other user info
  Future<void> _cacheUserData(LoginResponse loginResponse) async {
    final token = loginResponse.data?.token ?? '';
    if (token.isNotEmpty) {
      await _saveUserToken(token);
    }
  }

  @override
  Future<void> close() {
    _stopValidationListeners();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    return super.close();
  }
}
