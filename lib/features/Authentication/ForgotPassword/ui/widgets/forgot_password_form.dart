import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_cubit.dart';

/// Forgot Password Form with email input and a submit button
class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key, required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    final emailController = cubit.emailController;
    final emailFocusNode = cubit.emailFocusNode;

    // Dynamically enable button if email field is filled
    final bool isFormValid = emailController.text.trim().isNotEmpty;

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email input field
          EmailFormField(
            emailController: emailController,
            focusNode: emailFocusNode,
          ),

          verticalSpacing(kSpacingSmaller),

          // Submit button
          CustomButton(
            text: context.localization.send_code,
            isLoading: isLoading,
            isDisabled: !isFormValid,
            onPressed: () => _validateAndSubmit(context),
          ),
        ],
      ),
    );
  }

  /// Validates the form and triggers the cubit's password reset
  void _validateAndSubmit(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitResetPasswordStates();
    }
  }
}
