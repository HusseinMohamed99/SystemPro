import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/texts/have_an_account.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
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

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        spacing: kSpacingXLarge.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailFormField(
            emailController: context.read<LoginCubit>().emailController,
            focusNode: context.read<LoginCubit>().emailFocusNode,
          ),
          PasswordFormField(
            focusNode: context.read<LoginCubit>().passwordFocusNode,
            passwordController: context.read<LoginCubit>().passwordController,
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
          ),
          GestureDetector(
            onTap: () {
              // context.pushNamed(Routes.forgotPasswordView);
            },
            child: Text(
              context.localization.forgot_password,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ColorManager.primaryBlue,
              ),
            ),
          ),
          verticalSpacing(kSpacingSmaller),
          CustomButton(
            text: context.localization.login,
            onPressed: () {
              validateThenDoLogin(context);
            },
          ),
          const Spacer(),
          HaveAnAccountWidget(
            title1: context.localization.do_not_have_account,
            title2: context.localization.sign_up,
            onTap: () {
              context.pushNamed(Routes.signupView);
          },
          ),
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
