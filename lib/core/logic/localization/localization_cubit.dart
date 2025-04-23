import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/generated/l10n.dart';

class ChangeLocalizationCubit extends Cubit<ChangeLocalizationState> {
  ChangeLocalizationCubit() : super(const ChangeLocalizationState.initial());

  String currentLocalization = 'en';

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  void changeLocalization() {
    emit(const ChangeLocalizationState.loading());
    if (isArabic()) {
      currentLocalization = 'en';
      S.load(Locale(currentLocalization)); // Load English localization
      emit(ChangeLocalizationState.loaded(localization: currentLocalization));
    } else {
      currentLocalization = 'ar';
      S.load(Locale(currentLocalization)); // Load Arabic localization
      emit(ChangeLocalizationState.loaded(localization: currentLocalization));
    }

    // Update the locale for the app
    Intl.defaultLocale = currentLocalization;
  }
}
