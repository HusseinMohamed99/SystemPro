import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/repo/forgot_password_repo.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._forgotPasswordRepo)
    : super(const ForgotPasswordState.initial()){
    emailController.addListener(_updateFormValidity);
    }
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

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  void _updateFormValidity() {
    final isValid = emailController.text.trim().isNotEmpty;
    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(ForgotPasswordState.formValidityChanged(isValid));
    }
  }

  @override
  Future<void> close() {
    emailController.removeListener(_updateFormValidity);
    emailController.dispose();
    emailFocusNode.dispose();

    return super.close();
  }
}
