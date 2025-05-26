import 'package:flutter/material.dart';

/// Extension on [BuildContext] to easily access screen dimensions.
/// Useful for building responsive layouts based on screen size.
extension ResponsiveSizeExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
