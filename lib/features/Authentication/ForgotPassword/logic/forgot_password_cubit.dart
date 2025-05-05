import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/repo/forgot_password_repo.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._forgotPasswordRepo)
    : super(const ForgotPasswordState.initial());
  final ForgotPasswordRepo _forgotPasswordRepo;

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode emailFocusNode = FocusNode();

  void emitResetPasswordStates() async {
    emit(const ForgotPasswordState.forgotPasswordLoading());
    final response = await _forgotPasswordRepo.forgotPassword(
      ForgotPasswordRequestBody(email: emailController.text),
    );
    response.when(
      success: (resetPasswordResponse) {
        emit(ForgotPasswordState.forgotPasswordSuccess(resetPasswordResponse));
      },
      failure: (error) {
        emit(
          ForgotPasswordState.forgotPasswordError(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}
