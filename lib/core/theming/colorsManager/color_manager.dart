import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';

class ColorManager {
  static const Color primaryBlue = Color(0xFF6E62E5); // Formerly green
  static const Color secondaryBlue = Color(0xFFBD92FC); // Formerly green
  static const Color shadowBlue = Color(0xFFF1EFFC); // Formerly green
  static const Color secondaryShadowBlue = Color(0xFFBD92FC); // Formerly green
  static const Color pureBlack = Color(0xFF000000); // Formerly black
  static const Color primaryBlack = Color(
    0xFF0D0F11,
  ); // Formerly secondaryBlack
  static const Color secondaryBlack = Color(
    0xFF18181A,
  ); // Formerly secondaryBlack
  static const Color tertiaryBlack = Color(0xFF191D23);
  static const Color fourthBlack = Color(0xFF262C36);
  static const Color pureWhite = Color(0xFFFFFFFF); // Formerly white
  static const Color softWhite = Color(0xFFF9FAFA); // Formerly secondaryWhite
  static const Color offWhite = Color(0xFFE6E9E9); // Soft, muted white
  static const Color grey = Color(0xFF999CA1); // Very light grey
  static const Color softGray = Color(0xFF666666); // Very light orange
  static const Color lightGrey = Color(0xFFC9CECF); // Formerly lighterGrey
  static const Color lighterGrey = Color(0xFFDCDEDE); // Very light grey
  static const Color mediumGrey = Color(0xFF949D9E); // Formerly lightGrey
  static const Color borderGrey = Color(0xFFD8DADC); // Formerly lightGrey
  static const Color darkGrey = Color(0xFF4E5556); // Formerly grey
  static const Color hintGrey = Color(0xFFE3E3E3); // Formerly grey
  static const Color iconGrey = Color(0xFFB8C0CC); // Formerly grey
  static const Color brightRed = Color(0xFFF30202); // Formerly red
  static const Color errorRed = Color(0xFFB00020); // Red color for error text
}

class AdaptiveColor {
  static Color adaptiveColor({
    required BuildContext context,
    required Color lightColor,
    required Color darkColor,
  }) {
//  final isDark = context.watch<ChangeThemingCubit>().state.isDarkMode;
     final isDark = context.read<ChangeThemingCubit>().state.isDarkMode;

    return isDark ? darkColor : lightColor;
  }
}
