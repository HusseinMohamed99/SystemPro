import 'package:flutter/material.dart';

/// Extension on [BuildContext] to simplify access to [TextTheme] styles.
///
/// This allows direct access to commonly used text styles without needing to call
/// `Theme.of(context).textTheme` repeatedly.
extension TextStyleBuildContext<T> on BuildContext {
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
}
