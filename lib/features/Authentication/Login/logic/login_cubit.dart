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
  LoginCubit(this._loginRepo) : super(const LoginState.initial());
  final LoginRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  void emitLoginStates() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
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

  Future<void> savedUsersData(LoginResponse loginResponse) async {
    await CachingHelper.setData(
      SharedPrefKeys.userToken,
      loginResponse.data?.token?? '',
    );
  }

  Future<void> saveUserToken(String token) async {
    await CachingHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
