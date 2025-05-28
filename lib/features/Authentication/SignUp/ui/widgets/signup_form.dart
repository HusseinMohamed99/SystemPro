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

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.isLoading});

  final bool isLoading;
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
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SignupCubit>();

    // Attach listeners
    cubit.nameController.addListener(_updateFormValidity);
    cubit.emailController.addListener(_updateFormValidity);
    cubit.passwordController.addListener(_updateFormValidity);
    cubit.confirmPasswordController.addListener(_updateFormValidity);
  }

  void _updateFormValidity() {
    final cubit = context.read<SignupCubit>();
    final isValid =
        cubit.nameController.text.isNotEmpty &&
        cubit.emailController.text.isNotEmpty &&
        cubit.passwordController.text.isNotEmpty &&
        cubit.confirmPasswordController.text.isNotEmpty;

    if (_isFormValid != isValid) {
      setState(() => _isFormValid = isValid);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        spacing: kSpacingXLarge.h,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NameFormField(
            nameController: context.read<SignupCubit>().nameController,
            focusNode: context.read<SignupCubit>().nameFocusNode,
          ),
          EmailFormField(
            emailController: context.read<SignupCubit>().emailController,
            focusNode: context.read<SignupCubit>().emailFocusNode,
          ),
          PasswordFormField(
            focusNode: context.read<SignupCubit>().passwordFocusNode,
            passwordController: context.read<SignupCubit>().passwordController,
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
          ),
          ConfirmPasswordFormField(
            focusNode: context.read<SignupCubit>().confirmPasswordFocusNode,
            passwordController: context.read<SignupCubit>().passwordController,
            isPassword: isPassword,
            suffixIconOnTap: () {
              setState(changePassword);
            },
            visibilityIcon: suffix!,
            confirmPasswordController: context
                .read<SignupCubit>()
                .confirmPasswordController,
          ),
          verticalSpacing(kSpacingSmaller),
          CustomButton(
            text: context.localization.sign_up,
            isLoading: widget.isLoading,
            isDisabled: !_isFormValid,
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
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
