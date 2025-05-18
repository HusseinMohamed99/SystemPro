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

  late String currentLocalization;

  Future<void> _initLocalization() async {
    final savedLang =
        await CachingHelper.getData(SharedPrefKeys.selectedLanguage) ?? 'en';
    await changeLocalization(savedLang, save: false);
  }

  Future<void> changeLocalization(String localeCode, {bool save = true}) async {
    emit(const ChangeLocalizationState.loading());

    final supported = S.delegate.supportedLocales.any(
      (locale) => locale.languageCode == localeCode,
    );

    currentLocalization = supported ? localeCode : 'en';

    if (save) {
      await CachingHelper.setData(
        SharedPrefKeys.selectedLanguage,
        currentLocalization,
      );
    }

    Intl.defaultLocale = currentLocalization;
    await S.load(Locale(currentLocalization));

    emit(ChangeLocalizationState.loaded(localization: currentLocalization));
  }

  Future<void> toggleLocale() async {
    final newLocale = currentLocalization == 'ar' ? 'en' : 'ar';
    await changeLocalization(newLocale);
  }

  bool get isArabic => currentLocalization == 'ar';
}
