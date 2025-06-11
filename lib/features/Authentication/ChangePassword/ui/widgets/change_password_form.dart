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
    final changePasswordCubit = context.read<ChangePasswordCubit>();

    return Form(
      key: changePasswordCubit.formKey,
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
                    focusNode: changePasswordCubit.newPasswordFocusNode,
                    passwordController:
                        changePasswordCubit.newPasswordController,
                    isPassword: changePasswordCubit.isPasswordVisible,
                    suffixIconOnTap:
                        changePasswordCubit.togglePasswordVisibility,
                    visibilityIcon: changePasswordCubit.visibilityIcon,
                    onChanged:
                        (_) => changePasswordCubit.updateFormValidationState(),
                  ),
                  ConfirmPasswordFormField(
                    focusNode: changePasswordCubit.confirmPasswordFocusNode,
                    passwordController:
                        changePasswordCubit.newPasswordController,
                    confirmPasswordController:
                        changePasswordCubit.confirmPasswordController,
                    isPassword: changePasswordCubit.isPasswordVisible,
                    suffixIconOnTap:
                        changePasswordCubit.togglePasswordVisibility,
                    visibilityIcon: changePasswordCubit.visibilityIcon,
                    onChanged:
                        (_) => changePasswordCubit.updateFormValidationState(),
                  ),
                  verticalSpacing(kSpacingSmaller),
                  CustomButton(
                    text: context.localization.reset_password,
                    isLoading: isLoading,
                    isDisabled: !changePasswordCubit.isFormValid,
                    onPressed: () {
                      if (changePasswordCubit.formKey.currentState!
                          .validate()) {
                        FocusScope.of(context).unfocus();
                        changePasswordCubit.changePassword(
                          email: email,
                          context: context,
                        );
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
