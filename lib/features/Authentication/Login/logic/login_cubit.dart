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
    startValidationListeners();
  }

  final LoginRepo _loginRepo;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  void _validateForm() {
    final isValid =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(LoginState.formValidityChanged(isValid));
    }
  }

  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  IconData get passwordVisibilityIcon =>
      _isPasswordVisible ? Icons.visibility : Icons.visibility_off;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    emit(LoginState.passwordVisibilityChanged(_isPasswordVisible));
  }

  void startValidationListeners() {
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    await response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.data?.token ?? '');
        await savedUsersData(loginResponse);
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (error) {
        emit(LoginState.loginError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void submitIfFormValid() {
    if (formKey.currentState?.validate() ?? false) {
      emitLoginStates();
    }
  }

  Future<void> saveUserToken(String token) async {
    await CachingHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }

  Future<void> savedUsersData(LoginResponse loginResponse) async {
    final token = loginResponse.data?.token ?? '';
    await saveUserToken(token);
  }

  void stopValidationListeners() {
    emailController.removeListener(_validateForm);
    passwordController.removeListener(_validateForm);
  }

  @override
  Future<void> close() {
    stopValidationListeners();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    return super.close();
  }
}
