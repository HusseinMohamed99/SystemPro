import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/password_form_field_widget.dart';
import 'package:system_pro/core/widgets/texts/have_an_account.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, this.isLoading = false});
  final bool isLoading;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPassword = true;
  IconData suffix = Icons.visibility_off;
  late LoginCubit cubit;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<LoginCubit>();

    cubit.emailController.addListener(_updateFormValidity);
    cubit.passwordController.addListener(_updateFormValidity);
  }

  void _updateFormValidity() {
    final isValid =
        cubit.emailController.text.isNotEmpty &&
        cubit.passwordController.text.isNotEmpty;
    if (_isFormValid != isValid) {
      setState(() => _isFormValid = isValid);
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      isPassword = !isPassword;
      suffix = isPassword ? Icons.visibility_off : Icons.visibility;
    });
  }

  @override
  void dispose() {
    cubit.emailController.removeListener(_updateFormValidity);
    cubit.passwordController.removeListener(_updateFormValidity);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        spacing: kSpacingDefault.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailFormField(
            emailController: cubit.emailController,
            focusNode: cubit.emailFocusNode,
          ),
          PasswordFormField(
            focusNode: cubit.passwordFocusNode,
            passwordController: cubit.passwordController,
            isPassword: isPassword,
            suffixIconOnTap: togglePasswordVisibility,
            visibilityIcon: suffix,
          ),
          GestureDetector(
            onTap: () => context.pushNamed(Routes.forgotPasswordView),
            child: Text(
              context.localization.forgot_password,
              textAlign: TextAlign.right,
              style: context.titleMedium?.copyWith(
                color: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.primaryBlue,
                  darkColor: ColorManager.secondaryBlue,
                ),
              ),
            ),
          ),
          verticalSpacing(kSpacingDefault),
          CustomButton(
            text: context.localization.login,
            isLoading: widget.isLoading,
            isDisabled: !_isFormValid,
            onPressed: () => validateThenDoLogin(context),
          ),
          const Spacer(),
          HaveAnAccountWidget(
            title1: context.localization.do_not_have_account,
            title2: context.localization.sign_up,
            onTap: () => context.pushNamed(Routes.signupView),
          ),
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitLoginStates();
    }
  }
}
