import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

@freezed
class ChangeLocalizationState with _$ChangeLocalizationState {
  const factory ChangeLocalizationState.initial() = _Initial;
  const factory ChangeLocalizationState.loading() = _Loading;
  const factory ChangeLocalizationState.loaded({required String localization}) =
      _Loaded;
  const factory ChangeLocalizationState.error() = _Error;
}
