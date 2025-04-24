import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/texts/have_an_account.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/email_form_field_widget.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/password_form_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPassword = true;
  IconData? suffix = Icons.visibility_off;

  void changePassword() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: ,
      child: Column(
        spacing: kSpacingXLarge.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailFormField(emailController: TextEditingController()),
          PasswordFormField(
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
            passwordController: TextEditingController(),
          ),
          GestureDetector(
            onTap: () {
              // context.pushNamed(Routes.forgotPasswordView);
            },
            child: Text(
              context.localization.forgot_password,
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ColorManager.primaryBlue,
              ),
            ),
          ),
          verticalSpacing(kSpacingSmaller),
          CustomButton(text: context.localization.login, onPressed: () {}),
          Spacer(),
         HaveAnAccountWidget(
           title1: context.localization.do_not_have_account,
           title2: context.localization.sign_up,
           onTap: () {
             // context.pushNamed(Routes.signUpView);
           },
         ),
        ],
      ),
    );
  }
}
