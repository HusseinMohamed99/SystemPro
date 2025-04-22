import 'package:flutter/material.dart';
import 'package:system_pro/generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  S get localization => S.of(this);
}
