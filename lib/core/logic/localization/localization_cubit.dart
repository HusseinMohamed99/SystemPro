import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/generated/l10n.dart';

class ChangeLocalizationCubit extends HydratedCubit<ChangeLocalizationState> {
  ChangeLocalizationCubit()
    : super(const ChangeLocalizationState(localization: 'en')) {
    _init();
  }

  late String currentLanguageCode;

  Future<void> _init() async {
    await changeLocalization(state.localization, save: false);
  }

  Future<void> changeLocalization(String localeCode, {bool save = true}) async {
    final supported = S.delegate.supportedLocales.any(
      (locale) => locale.languageCode == localeCode,
    );

    currentLanguageCode = supported ? localeCode : 'en';

    Intl.defaultLocale = currentLanguageCode;
    await S.load(Locale(currentLanguageCode));

    emit(ChangeLocalizationState(localization: currentLanguageCode));
  }

  Future<void> toggleLocale() async {
    final newLocale = currentLanguageCode == 'ar' ? 'en' : 'ar';
    await changeLocalization(newLocale);
  }

  bool get isArabic => currentLanguageCode == 'ar';

  @override
  ChangeLocalizationState? fromJson(Map<String, dynamic> json) {
    final localeCode = json['localization'] as String?;
    if (localeCode == null) return null;
    return ChangeLocalizationState(localization: localeCode);
  }

  @override
  Map<String, dynamic>? toJson(ChangeLocalizationState state) {
    return {'localization': state.localization};
  }
}
