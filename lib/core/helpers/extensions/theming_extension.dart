import 'package:flutter/material.dart';

/// Extension on [BuildContext] to simplify access to [TextTheme] styles.
///
/// Allows writing `context.titleMedium` instead of
/// `Theme.of(context).textTheme.titleMedium`.
extension TextStyleBuildContext on BuildContext {
  /// Equivalent to `Theme.of(context).textTheme.displaySmall`
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;

  /// Equivalent to `Theme.of(context).textTheme.headlineLarge`
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  /// Equivalent to `Theme.of(context).textTheme.headlineMedium`
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  /// Equivalent to `Theme.of(context).textTheme.headlineSmall`
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  /// Equivalent to `Theme.of(context).textTheme.titleLarge`
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;

  /// Equivalent to `Theme.of(context).textTheme.titleMedium`
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;

  /// Equivalent to `Theme.of(context).textTheme.titleSmall`
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
}
