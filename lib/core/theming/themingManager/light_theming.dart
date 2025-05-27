import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';

/// Builds the light theme for the app, customizing colors,
///  fonts, and system UI overlays.
/// [textTheme] is the TextTheme to apply throughout
///  the app (supports dynamic theming).
ThemeData buildLightTheming({required TextTheme textTheme}) {
  return ThemeData(
    // Use the standard app font family.
    fontFamily: FontFamilyHelper.standardFont,

    // Set scaffold background to pure white.
    scaffoldBackgroundColor: ColorManager.pureWhite,

    // Configure the AppBar appearance and system overlays.
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.pureWhite,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.pureWhite,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ColorManager.pureWhite,
      ),
    ),

    // Generate a color scheme seeded by primaryBlue for consistent colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryBlue,
    ),

    // Apply the passed TextTheme.
    textTheme: textTheme,

    // Customize bottom navigation bar appearance.
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.pureWhite,
    ),
  );
}
