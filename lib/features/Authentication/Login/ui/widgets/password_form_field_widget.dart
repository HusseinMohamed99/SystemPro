


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/functions/remove_spacing.dart';
import 'package:system_pro/core/helpers/validations/validation_manager.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/textFields/custom_text_form_field.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.passwordController,
    required this.visibilityIcon,
    this.suffixIconOnTap,
    required this.isPassword,
  });
  final TextEditingController passwordController;
  final IconData visibilityIcon;
  final Function()? suffixIconOnTap;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
          Text(
          context.localization.password,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomTextFormField(
          isPassword: isPassword,
          controller: passwordController,
          onSaved: (value) => passwordController.text = value!,
          validator: (value) {
            return ValidationManager.passwordValidator(context, value!);
          },
          textInputType: TextInputType.visiblePassword,
          hintText: context.localization.password,
          textInputAction: TextInputAction.done,
          suffixIconOnTap: suffixIconOnTap,
          suffixIcon: Icon(
            visibilityIcon,
            color: ColorManager.lightGrey,
            size: kIconSizeDefault.sp,
          ),
          onChanged: (value) {
            onTextChanged(controller: passwordController, value: value);
          },
        ),
      ],
    );
  }
}
