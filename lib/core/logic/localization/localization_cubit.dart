import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/generated/l10n.dart';

class ChangeLocalizationCubit extends Cubit<ChangeLocalizationState> {
  ChangeLocalizationCubit() : super(const ChangeLocalizationState.initial());
  String currentLocalization = 'en';
  void changeLocalization(String localeCode) async {
    emit(const ChangeLocalizationState.loading());
    final supportedLocales = S.delegate.supportedLocales;
    const fallbackLocale = Locale('en');
    final isSupported = supportedLocales.any(
      (locale) => locale.languageCode == localeCode,
    );
    currentLocalization =
        isSupported ? localeCode : fallbackLocale.languageCode;
    Intl.defaultLocale = currentLocalization;
    await S.load(Locale(currentLocalization));
    emit(ChangeLocalizationState.loaded(localization: currentLocalization));
  }

  void toggleLocale() {
    final newLocale = currentLocalization == 'ar' ? 'en' : 'ar';
    changeLocalization(newLocale);
  }

  bool get isArabic => currentLocalization == 'ar';
}
