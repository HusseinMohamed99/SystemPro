import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

/// Returns a themed OutlineInputBorder with optional color and width.
/// Useful for form fields in both light/dark themes.
OutlineInputBorder buildOutlineBorder(
  BuildContext context, {
  Color? color,
  double? width,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      kBorderRadiusLarge.r,
    ), // Rounded corners
    borderSide: BorderSide(
      width: width ?? 1.w, // Border width, responsive or fixed
      color:
          color ??
          AdaptiveColor.adaptiveColor(
            context: context,
            lightColor: ColorManager.borderGrey,
            darkColor: ColorManager.tertiaryBlack,
          ),
    ),
  );
}
