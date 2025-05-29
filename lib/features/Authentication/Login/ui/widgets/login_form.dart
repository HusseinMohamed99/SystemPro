import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/password_form_field_widget.dart';
import 'package:system_pro/core/widgets/texts/have_an_account.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_state.dart';

/// Login form containing email/password fields, login button, and navigation options.
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (prev, curr) => curr is LoginSuccess || curr is LoginError,
      listener: (context, state) {
        if (state is LoginError) {
          context.showSnackBar(state.error); // Display error message
        }
        if (state is LoginSuccess) {
          context
            ..showSnackBar(context.localization.sign_in_successfully)
            ..pushReplacementNamed(Routes.mainView); // Navigate on success
        }
      },
      buildWhen:
          (prev, curr) =>
              curr is LoginLoading ||
              curr is LoginError ||
              curr is FormValidityChanged ||
              curr is PasswordVisibilityChanged,
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();
        final obscureText = !cubit.shouldShowPassword;
        final suffixIcon = cubit.passwordVisibilityIcon;
        final isDisabled = !cubit.isFormValid;
        final isLoading = state is LoginLoading;

        return Form(
          key: cubit.formKey,
          child: Column(
            spacing: kSpacingDefault.h,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Email input
              EmailFormField(
                emailController: cubit.emailController,
                focusNode: cubit.emailFocusNode,
              ),
              // Password input
              PasswordFormField(
                focusNode: cubit.passwordFocusNode,
                passwordController: cubit.passwordController,
                isPassword: obscureText,
                suffixIconOnTap: cubit.togglePasswordVisibility,
                visibilityIcon: suffixIcon,
              ),
              // Forgot password
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
              // Login button
              CustomButton(
                text: context.localization.login,
                isLoading: isLoading,
                isDisabled: isDisabled,
                onPressed: cubit.submitIfFormValid,
              ),
              const Spacer(),
              // Sign up redirection
              HaveAnAccountWidget(
                title1: context.localization.do_not_have_account,
                title2: context.localization.sign_up,
                onTap: () => context.pushNamed(Routes.signupView),
              ),
            ],
          ),
        );
      },
    );
  }
}
