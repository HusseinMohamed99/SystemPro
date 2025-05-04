import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/generated/l10n.dart';

class ChangeLocalizationCubit extends Cubit<ChangeLocalizationState> {
  ChangeLocalizationCubit() : super(const ChangeLocalizationState.initial());

  String currentLocalization = 'en';

  /// تُستخدم لتحميل اللغة المبدئية أثناء التشغيل
void changeLocalization(String localeCode) async {
    print('Trying to change locale to $localeCode');
    emit(const ChangeLocalizationState.loading());

    final supportedLocales = S.delegate.supportedLocales;
    final fallbackLocale = const Locale('en');

    // التحقق من أن اللغة مدعومة
    final isSupported = supportedLocales.any(
      (locale) => locale.languageCode == localeCode,
    );
    currentLocalization =
        isSupported ? localeCode : fallbackLocale.languageCode;

    Intl.defaultLocale = currentLocalization;
    await S.load(Locale(currentLocalization));

    emit(ChangeLocalizationState.loaded(localization: currentLocalization));
  }


  /// للتبديل بين اللغتين (عربي / إنجليزي)
  void toggleLocale() {
    final newLocale = currentLocalization == 'ar' ? 'en' : 'ar';
    changeLocalization(newLocale);
  }

  bool get isArabic => currentLocalization == 'ar';
}
