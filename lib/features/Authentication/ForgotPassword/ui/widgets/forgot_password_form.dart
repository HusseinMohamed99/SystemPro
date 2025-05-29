import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_state.dart';

/// Forgot Password form with email input and send button
class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ✅ Email Input Field
          EmailFormField(
            emailController: cubit.emailController,
            focusNode: cubit.emailFocusNode,
          ),

          verticalSpacing(kSpacingXXLarge),

          // ✅ Reactive Submit Button
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (prev, curr) =>
                curr is ForgotPasswordLoading ||
                curr is ForgotPasswordFormValidityChanged,
            builder: (context, state) {
              final isDisabled = !cubit.isFormValid;
              final isLoading = state is ForgotPasswordLoading;

              return CustomButton(
                text: context.localization.send_code,
                isDisabled: isDisabled,
                isLoading: isLoading,
                onPressed: () {
                  if (cubit.formKey.currentState?.validate() ?? false) {
                    cubit.submitForgotPassword();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
