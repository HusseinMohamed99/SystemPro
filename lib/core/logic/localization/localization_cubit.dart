import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/generated/l10n.dart';

class ChangeLocalizationCubit extends Cubit<ChangeLocalizationState> {
  ChangeLocalizationCubit() : super(const ChangeLocalizationState.initial()) {
    _initLocalization();
  }

  late String currentLanguageCode;

  /// Loads the cached language or defaults to English.
  Future<void> _initLocalization() async {
    final savedLang =
        await CachingHelper.getData(SharedPrefKeys.selectedLanguage) ?? 'en';
    await changeLocalization(savedLang, save: false);
  }

  /// Changes app language and saves it if requested.
  Future<void> changeLocalization(String localeCode, {bool save = true}) async {
    emit(const ChangeLocalizationState.loading());

    final supported = S.delegate.supportedLocales.any(
      (locale) => locale.languageCode == localeCode,
    );

    currentLanguageCode = supported ? localeCode : 'en';

    if (save) {
      await CachingHelper.setData(
        SharedPrefKeys.selectedLanguage,
        currentLanguageCode,
      );
    }

    Intl.defaultLocale = currentLanguageCode;
    await S.load(Locale(currentLanguageCode));

    emit(ChangeLocalizationState.loaded(localization: currentLanguageCode));
  }

  /// Toggles between Arabic and English.
  Future<void> toggleLocale() async {
    final newLocale = currentLanguageCode == 'ar' ? 'en' : 'ar';
    await changeLocalization(newLocale);
  }

  /// Returns true if the current language is Arabic.
  bool get isArabic => currentLanguageCode == 'ar';
}
