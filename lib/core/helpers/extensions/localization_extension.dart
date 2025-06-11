import 'package:flutter/material.dart';
import 'package:system_pro/generated/l10n.dart';

/// Extension on [BuildContext] to simplify access to localization utilities.
/// Includes:
/// - A shortcut to access localized strings.
/// - A quick check to determine if the current locale is Arabic.
extension LocalizationExtension on BuildContext {
  /// Returns the generated localization class [S] for the current context.
  /// Example:
  /// context.localization.appTitle;
  S get localization => S.of(this);

  /// Returns `true` if the current locale is Arabic (`'ar'`),
  ///  otherwise `false`.
  /// Useful for setting direction, layout, or font logic.
  bool get isAr => Localizations.localeOf(this).languageCode == 'ar';
  String get localeCode => Localizations.localeOf(this).languageCode;

  /// Returns text direction based on current language.
  /// Can be used for layout control.
  TextDirection get textDirection =>
      isAr ? TextDirection.rtl : TextDirection.ltr;
}
