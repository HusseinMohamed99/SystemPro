import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/confirm_password_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/name_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/password_form_field_widget.dart';
import 'package:system_pro/core/widgets/texts/have_an_account.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
    // passwordController = context.read<SignupCubit>().passwordController;
    // confirmPasswordController = context.read<SignupCubit>().confirmPasswordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: kSpacingXLarge.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NameFormField(
            nameController: TextEditingController(),
            focusNode: FocusNode(),
          ),
          EmailFormField(
            emailController: TextEditingController(),
            focusNode: FocusNode(),
          ),
          PasswordFormField(
            focusNode: FocusNode(),
            passwordController: TextEditingController(),
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
          ),
          ConfirmPasswordFormField(
            focusNode: FocusNode(),
            passwordController: TextEditingController(),
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
            confirmPasswordController: TextEditingController(),
          ),
          verticalSpacing(kSpacingSmaller),
          CustomButton(
            text: context.localization.sign_up,
            onPressed: () {
              validateThenDoSignUp(context);
            },
          ),
          const Spacer(),
          HaveAnAccountWidget(
            title1: context.localization.have_account,
            title2: context.localization.login,
            onTap: () {
              context.pushReplacementNamed(Routes.loginView);
            },
          ),
        ],
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    // if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
    //   context.read<SignUpCubit>().emitSignUpStates();
    // }
  }
}
