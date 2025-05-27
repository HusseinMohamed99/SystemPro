import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';

/// Builds the dark theme for the app, customizing colors,
///  fonts, and UI overlays.
/// [textTheme] is the TextTheme to apply throughout
/// the app (supports dynamic theming).
ThemeData buildDarkTheming({required TextTheme textTheme}) {
  return ThemeData(
    // Use the standard app font family.
    fontFamily: FontFamilyHelper.standardFont,

    // Set scaffold background to primary dark color.
    scaffoldBackgroundColor: ColorManager.primaryBlack,

    // Configure the AppBar appearance and system overlays.
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.primaryBlack,
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: ColorManager.secondaryBlack,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ColorManager.primaryBlack,
      ),
    ),

    // Generate a color scheme seeded by primaryBlack for consistent colors.
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.primaryBlack,
      brightness: Brightness.dark,
    ),

    // Apply the passed TextTheme.
    textTheme: textTheme,

    // Customize bottom navigation bar appearance.
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.tertiaryBlack,
    ),
  );
}
