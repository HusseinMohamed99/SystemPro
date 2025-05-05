import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/SignUp/data/model/sign_up_request_body.dart';
import 'package:system_pro/features/Authentication/SignUp/data/repo/sign_up_repo.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupRepo) : super(const SignupState.initial());
  final SignupRepo _signupRepo;

  final formKey = GlobalKey<FormState>();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  void emitSignupStates() async {
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
        nameController.clear();
        passwordController.clear();
        emailController.clear();
        confirmPasswordController.clear();
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
