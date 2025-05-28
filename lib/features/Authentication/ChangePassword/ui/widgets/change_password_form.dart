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

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({
    super.key,
    required this.email,
    required this.isLoading,
  });

  final String email;
  final bool isLoading;

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool isPassword = true;
  IconData suffix = Icons.visibility_off;

  late ChangePasswordCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ChangePasswordCubit>();
  }

  /// Toggles the visibility of password fields
  void togglePasswordVisibility() {
    setState(() {
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    });
  }

  /// Validates the form and triggers the password change logic
  void validateThenDoChangePassword() {
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitChangePasswordStates(email: widget.email);
    }
  }

  /// Checks if the form is valid for enabling the button
  bool get isFormValid =>
      cubit.newPasswordController.text.isNotEmpty &&
      cubit.confirmNewPasswordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: kSpacingXLarge.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Main Password Field
          PasswordFormField(
            focusNode: cubit.newPasswordFocusNode,
            passwordController: cubit.newPasswordController,
            isPassword: isPassword,
            suffixIconOnTap: togglePasswordVisibility,
            visibilityIcon: suffix,
          ),

          // Confirm Password Field
          ConfirmPasswordFormField(
            focusNode: cubit.confirmNewPasswordFocusNode,
            passwordController: cubit.newPasswordController,
            confirmPasswordController: cubit.confirmNewPasswordController,
            isPassword: isPassword,
            suffixIconOnTap: togglePasswordVisibility,
            visibilityIcon: suffix,
          ),

          verticalSpacing(kSpacingSmaller),

          // Submit Button
          CustomButton(
            text: context.localization.reset_password,
            isLoading: widget.isLoading,
            isDisabled: !isFormValid,
            onPressed: validateThenDoChangePassword,
          ),
        ],
      ),
    );
  }
}
