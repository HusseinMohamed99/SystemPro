import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/theming/themingManager/dark_theming.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';

class ChangeThemingCubit extends HydratedCubit<ChangeThemingState> {
  ChangeThemingCubit({
    required this.lightTextTheme,
    required this.darkTextTheme,
  }) : super(
         ChangeThemingState(
           theme: buildLightTheming(textTheme: lightTextTheme),
           isDarkMode: false,
         ),
       );

  final TextTheme lightTextTheme;
  final TextTheme darkTextTheme;

  void toggleTheme() {
    final isDark = !state.isDarkMode;
    _applyTheme(isDark);
  }

  void _applyTheme(bool isDark) {
    final newTheme =
        isDark
            ? buildDarkTheming(textTheme: darkTextTheme)
            : buildLightTheming(textTheme: lightTextTheme);

    emit(ChangeThemingState(theme: newTheme, isDarkMode: isDark));
  }

  @override
  ChangeThemingState? fromJson(Map<String, dynamic> json) {
    final isDark = json['isDarkMode'] as bool;
    final newTheme =
        isDark
            ? buildDarkTheming(textTheme: darkTextTheme)
            : buildLightTheming(textTheme: lightTextTheme);

    return ChangeThemingState(theme: newTheme, isDarkMode: isDark);
  }

  @override
  Map<String, dynamic>? toJson(ChangeThemingState state) {
    return {'isDarkMode': state.isDarkMode};
  }
}
