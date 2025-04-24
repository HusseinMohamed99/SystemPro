import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_theming_state.freezed.dart';

@freezed
class ChangeThemingState with _$ChangeThemingState {
  const factory ChangeThemingState.initial({
    required ThemeData theme,
    required bool isDarkMode,
  }) = _Initial;

  const factory ChangeThemingState.loading({
    required ThemeData theme,
    required bool isDarkMode,
  }) = _Loading;

  const factory ChangeThemingState.loaded({
    required ThemeData theme,
    required bool isDarkMode,
  }) = _Loaded;
}
