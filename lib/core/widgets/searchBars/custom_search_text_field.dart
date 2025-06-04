import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/images/custom_icon_image.dart';
import 'package:system_pro/core/widgets/outlineBorder/custom_outline_border.dart';
import 'package:system_pro/gen/assets.gen.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.readOnly = true,
    this.onTap,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final effectiveReadOnly = readOnly ?? true;

    // Common input border reused for consistency and performance.
    final border = buildOutlineBorder(context);

    return TextField(
      // Handles tap event: if the field is read-only,
      // use custom onTap or navigate to search view.
      onTap: () {
        if (effectiveReadOnly) {
          if (onTap != null) {
            onTap!(); // Execute custom onTap if provided
          } else {
            context.pushNamed(Routes.searchView); // Fallback to navigation
          }
        }
      },

      controller: controller,
      readOnly: effectiveReadOnly,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      style: context.titleMedium?.copyWith(
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.primaryBlack,
          darkColor: ColorManager.softWhite,
        ),
        fontWeight: FontWeightHelper.regular,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.softWhite,
          darkColor: ColorManager.tertiaryBlack,
        ),
        hintText: hintText ?? context.localization.search,
        hintStyle: context.titleMedium?.copyWith(
          color: AdaptiveColor.adaptiveColor(
            context: context,
            lightColor: ColorManager.softGrey,
            darkColor: ColorManager.hintGrey,
          ),
          fontWeight: FontWeightHelper.regular,
        ),
        // Show custom search icon or provided prefix
        prefixIcon: prefixIcon ?? CustomIconImage(image: Assets.images.search),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPaddingDefaultHorizontal.w,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }
}
