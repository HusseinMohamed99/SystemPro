import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/outlineBorder/custom_outline_border.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.focusNode,
    this.textInputType,
    required this.controller,
    this.textInputAction,
    this.suffixIcon,
    this.isPassword,
    this.onSaved,
    this.validator,
    this.suffixIconOnTap,
    this.onChanged,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.autofillHints,
    this.maxLines = 1,
  });
  final String hintText;
  final TextInputType? textInputType;
  final TextEditingController controller;
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
  final Iterable<String>? autofillHints;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: onChanged,
      obscuringCharacter: '*',
      controller: controller,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: isPassword ?? false,
      validator:
          validator ??
          (v) {
            if (v == null || v.isEmpty) {
              return context.localization.required_field;
            }
            return null;
          },
      autofillHints: autofillHints,
      maxLines: maxLines,
      style: context.titleLarge?.copyWith(
        color: customBlackAndWhiteColor(context),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: customWhiteAndTertiaryBlackColor(context),
        errorMaxLines: 2,
        hintText: hintText,
        hintStyle: context.titleLarge?.copyWith(
          color: customSoftAndHintGreyColor(context),
        ),
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: kPaddingContentHorizontal.w,
          vertical: kPaddingContentVertical.h,
        ),
        suffixIcon:
            suffixIcon == null
                ? null
                : IconButton(onPressed: suffixIconOnTap, icon: suffixIcon!),
        prefixIcon: prefixIcon,
        border: buildOutlineBorder(context),
        enabledBorder: buildOutlineBorder(context),
        focusedBorder: buildOutlineBorder(context),
        disabledBorder: buildOutlineBorder(context),
        focusedErrorBorder: buildOutlineBorder(
          context,
          color: ColorManager.errorRed,
        ),
        errorBorder: buildOutlineBorder(context, color: ColorManager.errorRed),
      ),
    );
  }
}
