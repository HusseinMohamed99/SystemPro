import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/repo/forgot_password_repo.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_state.dart';

/// Cubit responsible for managing the Forgot Password form state and API calls.
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this._forgotPasswordRepo)
    : super(const ForgotPasswordState.initial()) {
    // Listen to changes in email field and validate form on every change
    emailController.addListener(_updateFormValidity);
  }

  final ForgotPasswordRepo _forgotPasswordRepo;

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  /// Updates form validity based on email input.
  void _updateFormValidity() {
    final trimmed = emailController.text.trim();
    final isValid = trimmed.isNotEmpty && _isValidEmail(trimmed);

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      emit(ForgotPasswordState.forgotPasswordFormValidityChanged(isValid));
    }
  }

  /// Sends forgot password request to backend.
  Future<void> submitForgotPassword({required BuildContext context}) async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    final lang = context.localeCode;

    emit(const ForgotPasswordState.forgotPasswordLoading());

    final email = emailController.text.trim();

    final response = await _forgotPasswordRepo.forgotPassword(
      ForgotPasswordRequestBody(email: email),
      lang,
    );

    response.when(
      success: (response) {
        emit(ForgotPasswordState.forgotPasswordSuccess(response));
      },
      failure: (error) {
        emit(
          ForgotPasswordState.forgotPasswordError(
            error: error.apiErrorModel.message ?? 'Something went wrong.',
          ),
        );

        // إعادة حالة الفورم لتفعيل الزر من جديد
        emit(
          ForgotPasswordState.forgotPasswordFormValidityChanged(_isFormValid),
        );
      },
    );
  }

  /// Basic email format validation.
  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Future<void> close() {
    emailController.removeListener(_updateFormValidity);
    emailController.dispose();
    emailFocusNode.dispose();
    return super.close();
  }
}
