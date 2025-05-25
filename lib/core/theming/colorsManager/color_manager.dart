import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';

class ColorManager {
  // === Primary Colors ===
  static const Color primaryBlue = Color(
    0xFF6E62E5,
  ); // Main brand color – medium purple-blue
  static const Color secondaryBlue = Color(
    0xFFBD92FC,
  ); // Accent color – light lavender purple
  static const Color shadowBlue = Color(
    0xFFF1EFFC,
  ); // Background shadow – pale violet-blue
  static const Color secondaryShadowBlue = Color(
    0xFFBD92FC,
  ); // Duplicate of secondaryBlue

  // === Backgrounds & Surfaces ===
  static const Color pureWhite = Color(0xFFFFFFFF); // Base background
  static const Color softWhite = Color(
    0xFFF9FAFA,
  ); // Cards or elevated surfaces
  static const Color offWhite = Color(0xFFE6E9E9); // Muted background areas

  // === Blacks & Darks (Used in Dark Theme)
  static const Color pureBlack = Color(0xFF000000); // Absolute black
  static const Color primaryBlack = Color(
    0xFF0D0F11,
  ); // Primary dark background
  static const Color secondaryBlack = Color(
    0xFF18181A,
  ); // Secondary dark surface
  static const Color tertiaryBlack = Color(0xFF191D23); // Elevated dark surface
  static const Color fourthBlack = Color(
    0xFF262C36,
  ); // Toolbar/BottomSheet backgrounds

  // === Text & Icon Greys ===
  static const Color softGray = Color(0xFF666666); // Dark text or hint text
  static const Color grey = Color(0xFF999CA1); // Primary body text (light mode)
  static const Color mediumGrey = Color(0xFF949D9E); // Labels or subtitles
  static const Color darkGrey = Color(0xFF4E5556); // Icons or secondary text
  static const Color iconGrey = Color(0xFFB8C0CC); // Icon placeholder grey
  static const Color hintGrey = Color(0xFFE3E3E3); // Input hint background
  static const Color lightGrey = Color(
    0xFFC9CECF,
  ); // Divider lines or disabled elements
  static const Color lighterGrey = Color(0xFFDCDEDE); // Form field backgrounds
  static const Color borderGrey = Color(
    0xFFD8DADC,
  ); // Border color for containers

  // === Alerts & Status
  static const Color brightRed = Color(
    0xFFF30202,
  ); // Critical error/warning highlight
  static const Color errorRed = Color(
    0xFFB00020,
  ); // Error text color (Material Design compliant)
}

class AdaptiveColor {
  static Color adaptiveColor({
    required BuildContext context,
    required Color lightColor,
    required Color darkColor,
  }) {
    final isDark = context.read<ChangeThemingCubit>().state.isDarkMode;
    return isDark ? darkColor : lightColor;
  }
}
