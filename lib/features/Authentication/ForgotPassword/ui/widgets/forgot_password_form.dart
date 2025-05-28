import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_state.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  void _validateAndSubmit(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitResetPasswordStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email Field
          EmailFormField(
            emailController: cubit.emailController,
            focusNode: cubit.emailFocusNode,
          ),

          verticalSpacing(kSpacingXXLarge),

          // Listen to changes in form state
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (previous, current) =>
                current is ForgotPasswordLoading ||
                current is FormValidityChanged,
            builder: (context, state) {
              final isDisabled = !cubit.isFormValid;
              final isLoading = state is ForgotPasswordLoading;

              return CustomButton(
                text: context.localization.send_code,
                isLoading: isLoading,
                isDisabled: isDisabled,
                onPressed: () => _validateAndSubmit(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
