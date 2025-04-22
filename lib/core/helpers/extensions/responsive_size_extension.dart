import 'package:flutter/material.dart';

extension ResponsiveSizeBuildContext<T> on BuildContext {
  // MediaQuery Size Of
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}
