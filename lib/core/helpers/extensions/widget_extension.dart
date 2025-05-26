import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Extension on [Widget] to provide shorthand methods for common layout wrapping.
/// Makes code cleaner by avoiding repeated boilerplate for padding,
/// centering, and rounded clipping.
extension WidgetExtension on Widget {
  // Padding
  Widget allPadding({required double vPadding, required double hPadding}) =>
      Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: vPadding.h,
          horizontal: hPadding.w,
        ),
        child: this,
      );

  Widget vPadding(double padding) => Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: padding.h),
    child: this,
  );

  Widget hPadding(double padding) => Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: padding.w),
    child: this,
  );

  Widget onlyPadding({
    double topPadding = 0,
    double bottomPadding = 0,
    double leftPadding = 0,
    double rightPadding = 0,
  }) => Padding(
    padding: EdgeInsetsDirectional.only(
      top: topPadding.h,
      bottom: bottomPadding.h,
      start: leftPadding.w,
      end: rightPadding.w,
    ),
    child: this,
  );

  // Center Widget
  Widget center() => Center(child: this);

  // Warp the Widget with ClipRRect
  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) =>
      ClipRRect(borderRadius: borderRadius.r, child: this);
}
