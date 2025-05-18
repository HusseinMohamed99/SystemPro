import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/theming/themingManager/dark_theming.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';

class ChangeThemingCubit extends Cubit<ChangeThemingState> {
  ChangeThemingCubit({
    required ThemeData initialTheme,
    required this.lightTextTheme,
    required this.darkTextTheme,
    required bool isDarkMode,
  }) : super(
         ChangeThemingState.initial(
           theme: initialTheme,
           isDarkMode: isDarkMode,
         ),
       );

  final TextTheme lightTextTheme;
  final TextTheme darkTextTheme;

  void toggleTheme() {
    final isDark = !state.isDarkMode;
    final newTheme =
        isDark
            ? buildDarkTheming(textTheme: darkTextTheme)
            : buildLightTheming(textTheme: lightTextTheme);

    emit(ChangeThemingState.loaded(theme: newTheme, isDarkMode: isDark));
  }

  ThemeData get currentTheme => state.theme;
}
