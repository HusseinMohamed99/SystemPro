import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/networking/backend/dio_factory.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_request_body.dart';
import 'package:system_pro/features/Authentication/Login/data/model/login_response.dart';
import 'package:system_pro/features/Authentication/Login/data/repo/login_repo.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_state.dart';

/// Handles login logic, form validation, and token caching
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(const LoginState.initial()) {
    _startValidationListeners();
  }

  final LoginRepo _loginRepo;

  // Controllers & FocusNodes
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  // Password visibility state
  bool _isPasswordVisible = false;
  bool get shouldShowPassword => _isPasswordVisible;
  IconData get passwordVisibilityIcon =>
      _isPasswordVisible ? Icons.visibility : Icons.visibility_off;

  // Form validity
  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  /// Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(LoginState.passwordVisibilityChanged(_isPasswordVisible));
  }

  /// Start validation listeners on input fields
  void _startValidationListeners() {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  /// Stop listeners and dispose controllers
  void _stopValidationListeners() {
    emailController.removeListener(_validateForm);
    passwordController.removeListener(_validateForm);
  }

  /// Validate form fields to determine if submit button should be enabled
  void _validateForm() {
    final isValid =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(LoginState.formValidityChanged(isValid));
    }
  }

  /// Validate and submit the login form
  void submitIfFormValid({required BuildContext context}) {
    if (formKey.currentState?.validate() ?? false) {
      final lang = context.localeCode; // استخراج اللغة قبل async
      _performLogin(lang: lang); // مرر القيمة فقط
    }
  }

  /// Perform login using repository and emit appropriate state
Future<void> _performLogin({required String lang}) async {

    emit(const LoginState.loginLoading());

    try {
      final response = await _loginRepo.login(
        LoginRequestBody(
          email: emailController.text,
          password: passwordController.text,
        ),
        lang,
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
          // ✅ Restore form state to allow button again
          emit(LoginState.formValidityChanged(_isFormValid));
        },
      );
    } catch (e) {
      emit(const LoginState.loginError(error: 'Unexpected error occurred'));
      // ✅ Restore form state even on unexpected errors
      emit(LoginState.formValidityChanged(_isFormValid));
    }
  }

  /// Save token to cache and set it in Dio headers
  Future<void> _saveUserToken(String token) async {
    await CachingHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  /// Cache user data after successful login
  Future<void> _cacheUserData(LoginResponse loginResponse) async {
    final token = loginResponse.data?.token ?? '';
    if (token.isNotEmpty) {
      await _saveUserToken(token);
    }
  }

  /// Dispose controllers and listeners
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
