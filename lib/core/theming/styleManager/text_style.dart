import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/responsive/responsive_font_size.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/font_size.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

abstract class TextStyleManager {
  static TextStyle bold23({required BuildContext context, Color? color}) {
    return TextStyle(
      color: color ?? ColorManager.pureBlack,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s23),
      fontWeight: FontWeightHelper.bold,
      fontFamily: FontFamilyHelper.standardFont,
    );
  }
    static TextStyle bold13({
    required BuildContext context,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color ?? ColorManager.mediumGrey,
      fontSize: getResponsiveFontSize(context, fontSize: FontSizeHelper.s13),
      fontWeight: FontWeightHelper.bold,
      fontFamily: FontFamilyHelper.standardFont,
      decoration: decoration ?? TextDecoration.none,
    );
  }
}
