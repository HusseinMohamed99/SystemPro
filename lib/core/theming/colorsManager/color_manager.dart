import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/extensions/color_extension.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';

/// Manages the primary and secondary colors used throughout the app.
class ColorManager {
  // === Primary Colors ===
  /// Main brand color – medium purple-blue.
  static const Color primaryBlue = Color(0xFF6E62E5);

  /// Accent color – light lavender purple.
  static const Color secondaryBlue = Color(0xFFBD92FC);

  /// Background shadow – pale violet-blue.
  static const Color shadowBlue = Color(0xFFF1EFFC);

  /// Background secondary shadow Blue.
  static const Color secondaryShadowBlue = Color(0xFFBD92FC);

  // === Backgrounds & Surfaces ===
  /// Base background color – pure white.
  static const Color pureWhite = Color(0xFFFFFFFF);

  /// Cards or elevated surfaces background – soft white.
  static const Color softWhite = Color(0xFFF9FAFA);

  /// Muted background areas – off white.
  static const Color offWhite = Color(0xFFE6E9E9);

  // === Blacks & Darks (Used in Dark Theme) ===
  /// Absolute black color.
  static const Color pureBlack = Color(0xFF000000);

  /// Primary dark background.
  static const Color primaryBlack = Color(0xFF0D0F11);

  /// Secondary dark surface color.
  static const Color secondaryBlack = Color(0xFF18181A);

  /// Elevated dark surface.
  static const Color tertiaryBlack = Color(0xFF191D23);

  /// Toolbar/BottomSheet backgrounds.
  static const Color fourthBlack = Color(0xFF262C36);

  // === Text & Icon Greys ===
  /// Dark text or hint text color.
  static const Color softGrey = Color(0xFF666666);

  /// Primary body text color for light mode.
  static const Color grey = Color(0xFF999CA1);

  /// Labels or subtitles color.
  static const Color mediumGrey = Color(0xFF949D9E);

  /// Icons or secondary text color.
  static const Color darkGrey = Color(0xFF4E5556);

  /// Icon placeholder grey.
  static const Color iconGrey = Color(0xFFB8C0CC);

  /// Input hint background color.
  static const Color hintGrey = Color(0xFFE3E3E3);

  /// Divider lines or disabled elements color.
  static const Color lightGrey = Color(0xFFC9CECF);

  /// Form field backgrounds color.
  static const Color lighterGrey = Color(0xFFDCDEDE);

  /// Border color for containers.
  static const Color borderGrey = Color(0xFFD8DADC);

  // === Alerts & Status ===
  /// Critical error/warning highlight color.
  static const Color brightRed = Color(0xFFF30202);

  /// Error text color compliant with Material Design.
  static const Color errorRed = Color(0xFFB00020);

  /// Safely converts a hex string to a [Color],
  ///  returns [fallback] if conversion fails.
  static Color safeHex(String hex, [Color fallback = Colors.black]) {
    return hex.toColor() ?? fallback;
  }
}

/// Helper class for returning colors adaptive
///  to the current theme (dark or light).
class AdaptiveColor {
  /// Returns [darkColor] if current ThemeMode is dark,
  /// otherwise returns [lightColor].
  /// Relies on Theme.of(context).brightness.
  static Color adaptiveColor({
    required BuildContext context,
    required Color lightColor,
    required Color darkColor,
  }) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? darkColor : lightColor;
  }
}
