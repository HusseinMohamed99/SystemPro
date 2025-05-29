import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/remove_spacing.dart';
import 'package:system_pro/core/helpers/validations/validation_manager.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/textFields/custom_text_form_field.dart';

class ConfirmPasswordFormField extends StatelessWidget {
  const ConfirmPasswordFormField({
    super.key,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.visibilityIcon,
    this.suffixIconOnTap,
    required this.isPassword,
    required this.focusNode,
    this.onChanged,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final IconData visibilityIcon;
  final Function()? suffixIconOnTap;
  final bool isPassword;
  final FocusNode focusNode;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.localization.confirm_password, style: context.titleMedium),
        CustomTextFormField(
          autofillHints: const [AutofillHints.password],
          focusNode: focusNode,
          isPassword: isPassword,
          controller: confirmPasswordController,
          validator:
              (value) => ValidationManager.repeatPasswordValidator(
                context,
                value: value ?? '',
                password: passwordController.text,
              ),
          textInputType: TextInputType.visiblePassword,
          hintText: context.localization.confirm_password,
          textInputAction: TextInputAction.done,
          suffixIconOnTap: suffixIconOnTap,
          suffixIcon: Icon(
            visibilityIcon,
            color: ColorManager.lightGrey,
            size: kIconSizeDefault.sp,
          ),
          onChanged: (value) {
            onChanged?.call(value);
            confirmPasswordController.removeSpaces();
          },
        ),
      ],
    );
  }
}
