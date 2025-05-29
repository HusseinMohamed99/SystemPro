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
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/name_form_field_widget.dart';
import 'package:system_pro/core/widgets/textFields/password_form_field_widget.dart';
import 'package:system_pro/core/widgets/texts/have_an_account.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_cubit.dart';
import 'package:system_pro/features/Authentication/SignUp/logic/sign_up_state.dart';

/// Signup form fields and submission button.
/// Reacts to form validity and password visibility only.
class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen:
          (prev, curr) =>
              curr is SignupFormValidityChanged ||
              curr is SignupPasswordVisibilityChanged ||
              curr is SignupLoading,
      builder: (context, state) {
        final cubit = context.read<SignupCubit>();
        final isDisabled = !cubit.isFormValid;
        final isPassword = !cubit.isPasswordVisible;
        final suffixIcon = cubit.passwordVisibilityIcon;
        final isLoading = state is SignupLoading;

        return Form(
          key: cubit.formKey,
          child: Column(
            spacing: kSpacingXLarge.h,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NameFormField(
                nameController: cubit.nameController,
                focusNode: cubit.nameFocusNode,
              ),
              EmailFormField(
                emailController: cubit.emailController,
                focusNode: cubit.emailFocusNode,
              ),
              PasswordFormField(
                focusNode: cubit.passwordFocusNode,
                passwordController: cubit.passwordController,
                isPassword: isPassword,
                suffixIconOnTap: cubit.togglePasswordVisibility,
                visibilityIcon: suffixIcon,
              ),
              ConfirmPasswordFormField(
                focusNode: cubit.confirmPasswordFocusNode,
                passwordController: cubit.passwordController,
                confirmPasswordController: cubit.confirmPasswordController,
                isPassword: isPassword,
                suffixIconOnTap: cubit.togglePasswordVisibility,
                visibilityIcon: suffixIcon,
              ),
              verticalSpacing(kSpacingSmaller),
              CustomButton(
                text: context.localization.sign_up,
                isLoading: isLoading,
                isDisabled: isDisabled,
                onPressed: cubit.submitIfFormValid,
              ),
              const Spacer(),
              HaveAnAccountWidget(
                title1: context.localization.have_account,
                title2: context.localization.login,
                onTap: () => context.pushReplacementNamed(Routes.loginView),
              ),
            ],
          ),
        );
      },
    );
  }
}
