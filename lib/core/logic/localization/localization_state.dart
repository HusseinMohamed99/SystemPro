import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

@freezed
class ChangeLocalizationState with _$ChangeLocalizationState {
  const factory ChangeLocalizationState({required String localization}) =
      _ChangeLocalizationState;
}
