import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
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
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final IconData visibilityIcon;
  final Function()? suffixIconOnTap;
  final bool isPassword;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.confirm_password,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomTextFormField(
          focusNode: focusNode,
          isPassword: isPassword,
          controller: confirmPasswordController,
          onSaved: (value) => confirmPasswordController.text = value!,
          validator:
              (value) => ValidationManager.repeatPasswordValidator(
                context,
                value: value,
                password:
                    passwordController.text, // تمرير كلمة المرور الأصلية هنا
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
          confirmPasswordController.removeSpaces();
          },
        ),
      ],
    );
  }
}
