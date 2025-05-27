import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/responsive/responsive_font_size.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/font_size.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

/// Manages app-wide text styles supporting light and dark themes,
/// and responsive font sizing.
class AppTextStyleManager {
  static const _fontFamily = FontFamilyHelper.standardFont;

  /// Returns the TextTheme configured for light mode.
  static TextTheme lightTextTheme(BuildContext context) =>
      _buildTextTheme(context, isDark: false);

  /// Returns the TextTheme configured for dark mode.
  static TextTheme darkTextTheme(BuildContext context) =>
      _buildTextTheme(context, isDark: true);

  /// Internal method to create TextTheme based on [isDark] flag.
  static TextTheme _buildTextTheme(
    BuildContext context, {
    required bool isDark,
  }) {
    final Color textColor =
        isDark ? ColorManager.pureWhite : ColorManager.pureBlack;

    return TextTheme(
      displaySmall: _textStyle(
        context,
        fontSize: FontSizeHelper.s36,
        fontWeight: FontWeightHelper.semiBold,
        color: ColorManager.primaryBlue,
      ),
      headlineLarge: _textStyle(
        context,
        fontSize: FontSizeHelper.s32,
        fontWeight: FontWeightHelper.semiBold,
        color: textColor,
      ),
      headlineMedium: _textStyle(
        context,
        fontSize: FontSizeHelper.s24,
        fontWeight: FontWeightHelper.semiBold,
        color: textColor,
      ),
      headlineSmall: _textStyle(
        context,
        fontSize: FontSizeHelper.s20,
        fontWeight: FontWeightHelper.semiBold,
        color: textColor,
      ),
      titleLarge: _textStyle(
        context,
        fontSize: FontSizeHelper.s16,
        fontWeight: FontWeightHelper.semiBold,
        color: textColor,
      ),
      titleMedium: _textStyle(
        context,
        fontSize: FontSizeHelper.s14,
        fontWeight: FontWeightHelper.semiBold,
        color: textColor,
      ),
      titleSmall: _textStyle(
        context,
        fontSize: FontSizeHelper.s12,
        fontWeight: FontWeightHelper.regular,
        color: textColor,
      ),
    );
  }

  /// Helper to create a [TextStyle] with responsive size
  ///  and consistent font family.
  static TextStyle _textStyle(
    BuildContext context, {
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
  }) {
    return TextStyle(
      color: color,
      fontSize: getResponsiveFontSize(context, fontSize: fontSize),
      fontWeight: fontWeight,
      fontFamily: _fontFamily,
    );
  }
}
