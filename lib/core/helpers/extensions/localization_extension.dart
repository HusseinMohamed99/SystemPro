import 'package:flutter/material.dart';
import 'package:system_pro/generated/l10n.dart';

/// Extension on [BuildContext] to simplify access to localization utilities.
/// Provides quick access to the generated localization class [S] and a
/// language check for Arabic.

extension LocalizationExtension on BuildContext {
  S get localization => S.of(this);
  bool get isAr => Localizations.localeOf(this).languageCode == 'ar';
}
