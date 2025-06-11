import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_theming_state.freezed.dart';

@freezed
class ChangeThemingState with _$ChangeThemingState {
  const factory ChangeThemingState({
    required ThemeData theme,
    required bool isDarkMode,
  }) = _ChangeThemingState;
}
