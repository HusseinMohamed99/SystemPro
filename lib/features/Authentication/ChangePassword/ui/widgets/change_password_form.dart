import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/confirm_password_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/password_form_field_widget.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_cubit.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key, required this.email});
  final String email;

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool isPassword = true;
  IconData? suffix = Icons.visibility_off;

  void changePassword() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
  }

  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  @override
  void initState() {
    super.initState();
    passwordController =
        context.read<ChangePasswordCubit>().newPasswordController;
    confirmPasswordController =
        context.read<ChangePasswordCubit>().confirmNewPasswordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ChangePasswordCubit>().formKey,
      child: Column(
        spacing: kSpacingXLarge.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PasswordFormField(
            focusNode: context.read<ChangePasswordCubit>().newPasswordFocusNode,
            passwordController:
                context.read<ChangePasswordCubit>().newPasswordController,
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
          ),
          ConfirmPasswordFormField(
            focusNode:
                context.read<ChangePasswordCubit>().confirmNewPasswordFocusNode,
            passwordController:
                context
                    .read<ChangePasswordCubit>()
                    .confirmNewPasswordController,
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
            confirmPasswordController:
                context
                    .read<ChangePasswordCubit>()
                    .confirmNewPasswordController,
          ),
          verticalSpacing(kSpacingSmaller),
          CustomButton(
            text: context.localization.reset_password,
            onPressed: () {
               validateThenDoChangePassword(context);
            },
          ),
        ],
      ),
    );
  }

  void validateThenDoChangePassword(BuildContext context) {
    if (context.read<ChangePasswordCubit>().formKey.currentState!.validate()) {
      context.read<ChangePasswordCubit>().emitChangePasswordStates(
        email: widget.email,
      );
    }
  }
}
