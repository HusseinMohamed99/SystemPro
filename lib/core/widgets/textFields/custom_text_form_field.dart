import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.focusNode,
    this.textInputType,
    this.controller,
    this.textInputAction,
    this.suffixIcon,
    this.isPassword,
    this.onSaved,
    this.validator,
    this.suffixIconOnTap,
    this.onChanged,
    this.prefixIcon,
    this.onFieldSubmitted,
  });
  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isPassword;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function()? suffixIconOnTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      obscuringCharacter: '*',
      controller: controller ?? TextEditingController(),
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isPassword ?? false,
      validator:
          validator ??
          (v) {
            if (v == null || v.isEmpty) {
              return 'هذا الحقل مطلوب';
            }
            return null;
          },
      style: context.titleLarge?.copyWith(
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.pureBlack,
          darkColor: ColorManager.pureWhite,
        ),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.pureWhite,
          darkColor: ColorManager.tertiaryBlack,
        ),
        hintText: hintText,
        hintStyle: context.titleLarge?.copyWith(color: ColorManager.grey),
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPaddingContentHorizontal.w,
          vertical: kPaddingContentVertical.h,
        ),
        suffixIcon:
            suffixIcon == null
                ? null
                : IconButton(onPressed: suffixIconOnTap, icon: suffixIcon!),
        prefixIcon:
            prefixIcon == null
                ? null
                : IconButton(onPressed: () {}, icon: prefixIcon!),
        border: buildOutlineBorder(),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
        disabledBorder: buildOutlineBorder(),
        focusedErrorBorder: buildOutlineBorder(color: ColorManager.errorRed),
        errorBorder: buildOutlineBorder(color: ColorManager.errorRed),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusLarge).r,
      borderSide: BorderSide(
        width: 1.w,
         color: color ?? ColorManager.borderGrey,
      ),
    );
  }
}
