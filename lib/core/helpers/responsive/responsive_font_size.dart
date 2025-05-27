import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';

/// Calculates a responsive font size based on screen width.
/// Scales between 80% to 120% of the original size to prevent extremes.
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  final double scaleFactor = _getScaleFactor(context);
  final double responsiveFontSize = fontSize * scaleFactor;
  final double lowerLimit = fontSize * .8;
  final double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

/// Gets a scale factor based on screen width.
/// Breakpoints: <600 → small, <900 → medium, >=900 → large screens.
double _getScaleFactor(BuildContext context) {
  final double width = context.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

