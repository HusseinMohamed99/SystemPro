import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtension on Widget {
  // Padding
  Widget allPadding({required double vPadding, required double hPadding}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          vertical: vPadding.h,
          horizontal: hPadding.w,
        ),
        child: this,
      );
  Widget vPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding.h), child: this);

  Widget hPadding(double padding) => Padding(
    padding: EdgeInsets.symmetric(horizontal: padding.w),
    child: this,
  );

  Widget onlyPadding({
    double topPadding = 0,
    double bottomPadding = 0,
    double leftPadding = 0,
    double rightPadding = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      top: topPadding.h,
      bottom: bottomPadding.h,
      left: leftPadding.w,
      right: rightPadding.w,
    ),
    child: this,
  );

  // Center Widget
  Widget center() => Center(child: this);

  // Warp the Widget with ClipRRect
  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) =>
      ClipRRect(borderRadius: borderRadius.r, child: this);
}
