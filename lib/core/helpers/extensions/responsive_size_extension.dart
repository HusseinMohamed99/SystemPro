import 'package:flutter/material.dart';

/// Extension on [BuildContext] to easily access screen dimensions.
///
/// Useful for building responsive layouts without repeating `MediaQuery` calls.
extension ResponsiveSizeExtension on BuildContext {
  /// Returns the full height of the current screen.
  double get height => MediaQuery.sizeOf(this).height;

  /// Returns the full width of the current screen.
  double get width => MediaQuery.sizeOf(this).width;
}
