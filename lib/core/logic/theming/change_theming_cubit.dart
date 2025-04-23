import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/logic/theming/change_theming_state.dart';
import 'package:system_pro/core/theming/themingManager/dark_theming.dart';
import 'package:system_pro/core/theming/themingManager/light_theming.dart';

class ChangeThemingCubit extends Cubit<ChangeThemingState> {
  ChangeThemingCubit()
    : super(ChangeThemingState.initial(theme: buildLightTheming()));

  bool isDarkMode = false;

  void toggleTheme() {
    emit(ChangeThemingState.loading(theme: state.theme));

    isDarkMode = !isDarkMode;

    final newTheme = isDarkMode ? buildDarkTheming() : buildLightTheming();
    emit(ChangeThemingState.loaded(theme: newTheme));
  }

  ThemeData get currentTheme => state.theme;
}
