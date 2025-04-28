import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/responsive/responsive_font_size.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/font_size.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

// abstract class TextStyleManager {
//   static TextStyle semiBold32({required BuildContext context, Color? color}) {
//     return TextStyle(
//       color: color ?? ColorManager.pureBlack,
//       fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s32),
//       fontWeight: FontWeightHelper.semiBold,
//       fontFamily: FontFamilyHelper.standardFont,
//     );
//   }

//   //TODO: TestSytle
//   static TextStyle bold23({required BuildContext context, Color? color}) {
//     return TextStyle(
//       color: color ?? ColorManager.pureBlack,
//       fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s23),
//       fontWeight: FontWeightHelper.bold,
//       fontFamily: FontFamilyHelper.standardFont,
//     );
//   }

//   static TextStyle bold13({
//     required BuildContext context,
//     Color? color,
//     TextDecoration? decoration,
//   }) {
//     return TextStyle(
//       color: color ?? ColorManager.mediumGrey,
//       fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s13),
//       fontWeight: FontWeightHelper.bold,
//       fontFamily: FontFamilyHelper.standardFont,
//       decoration: decoration ?? TextDecoration.none,
//     );
//   }
// }

class AppTextStyleManager {
  static const _fontFamily = FontFamilyHelper.standardFont;

  static TextTheme lightTextTheme(BuildContext context) => TextTheme(
    displaySmall: TextStyle(
      color: ColorManager.primaryBlue,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s36),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: _fontFamily,
    ),
    headlineLarge: TextStyle(
      color: ColorManager.pureBlack,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s32),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: _fontFamily,
    ),
    headlineMedium: TextStyle(
      color: ColorManager.pureBlack,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s24),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: _fontFamily,
    ),
    headlineSmall: TextStyle(
      color: ColorManager.pureBlack,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s20),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: _fontFamily,
    ),
    titleLarge: TextStyle(
      color: ColorManager.pureBlack,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s16),
      fontWeight: FontWeightHelper.regular,
      fontFamily: _fontFamily,
    ),
    titleMedium: TextStyle(
      color: ColorManager.pureBlack,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s14),
      fontWeight: FontWeightHelper.regular,
      fontFamily: _fontFamily,
    ),

    // ضيف باقي الأنماط حسب احتياجك
  );

  static TextTheme darkTextTheme(BuildContext context) => TextTheme(
     displaySmall: TextStyle(
      color: ColorManager.primaryBlue,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s36),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: _fontFamily,
    ),
    headlineLarge: TextStyle(
      color: ColorManager.pureWhite,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s32),
      fontWeight: FontWeightHelper.semiBold,
      fontFamily: _fontFamily,
    ),
  );
}
