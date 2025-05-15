import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';

ThemeData buildLightTheming({required TextTheme textTheme}) {
  return ThemeData(
    fontFamily: FontFamilyHelper.standardFont,
    scaffoldBackgroundColor: ColorManager.pureWhite,
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
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.primaryBlue),
    textTheme: textTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.pureWhite,
    ),
  );
}
