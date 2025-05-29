import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/confirm_password_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/password_form_field_widget.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_cubit.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_state.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({
    super.key,
    required this.email,
    required this.isLoading,
  });

  final String email;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChangePasswordCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: kSpacingXLarge.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // BlocBuilder for password visibility changes
          BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
            buildWhen:
                (prev, curr) =>
                    curr is PasswordVisibilityChanged ||
                    curr is FormValidationChanged,
            builder: (context, state) {
              return Column(
                spacing: kSpacingXLarge.h,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PasswordFormField(
                    focusNode: cubit.newPasswordFocusNode,
                    passwordController: cubit.newPasswordController,
                    isPassword: cubit.isPasswordVisible,
                    suffixIconOnTap: cubit.togglePasswordVisibility,
                    visibilityIcon: cubit.visibilityIcon,
                    onChanged: (_) => cubit.updateFormValidationState(),
                  ),
                  ConfirmPasswordFormField(
                    focusNode: cubit.confirmPasswordFocusNode,
                    passwordController: cubit.newPasswordController,
                    confirmPasswordController: cubit.confirmPasswordController,
                    isPassword: cubit.isPasswordVisible,
                    suffixIconOnTap: cubit.togglePasswordVisibility,
                    visibilityIcon: cubit.visibilityIcon,
                    onChanged: (_) => cubit.updateFormValidationState(),
                  ),
                  verticalSpacing(kSpacingSmaller),
                  CustomButton(
                    text: context.localization.reset_password,
                    isLoading: isLoading,
                    isDisabled: !cubit.isFormValid,
                    onPressed: () {
                      if (cubit.formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        cubit.changePassword(email: email);
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
