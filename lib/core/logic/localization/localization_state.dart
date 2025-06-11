import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization_state.freezed.dart';

@freezed
class ChangeLocalizationState with _$ChangeLocalizationState {
  const factory ChangeLocalizationState.initial() = ChangeLocalizationInitial;
  const factory ChangeLocalizationState.loading() = ChangeLocalizationLoading;
  const factory ChangeLocalizationState.loaded({required String localization}) =
      ChangeLocalizationLoaded;
  const factory ChangeLocalizationState.error({required String error}) =
      ChangeLocalizationError;
}
