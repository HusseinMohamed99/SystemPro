import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Extension on [Widget] to provide shorthand methods for common layout wrapping
/// Makes code cleaner by avoiding repeated boilerplate for padding,
/// centering, and rounded clipping using [ScreenUtil] scaling.
extension WidgetExtension on Widget {
  /// Wraps the widget with symmetric vertical and horizontal padding.
  Widget allPadding({required double vPadding, required double hPadding}) =>
      Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: vPadding.h,
          horizontal: hPadding.w,
        ),
        child: this,
      );

  /// Wraps the widget with vertical-only padding.
  Widget vPadding(double padding) => Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: padding.h),
    child: this,
  );

  /// Wraps the widget with horizontal-only padding.
  Widget hPadding(double padding) => Padding(
    padding: EdgeInsetsDirectional.symmetric(horizontal: padding.w),
    child: this,
  );

  /// Wraps the widget with custom padding on each side.
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

  /// Centers the widget using [Center].
  Widget center() => Center(child: this);

  /// Wraps the widget with a [ClipRRect] using the provided [BorderRadius].
  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) =>
      ClipRRect(borderRadius: borderRadius.r, child: this);

      Widget align ({required Alignment alignment}) => Align(alignment: alignment, child: this);
      Widget alignTop () => align(alignment: Alignment.topCenter);
      Widget alignBottom () => align(alignment: Alignment.bottomCenter);
      Widget alignLeft () => align(alignment: Alignment.centerLeft);
      Widget alignRight () => align(alignment: Alignment.centerRight);
      Widget alignTopLeft () => align(alignment: Alignment.topLeft);
      Widget alignTopRight () => align(alignment: Alignment.topRight);
      Widget alignBottomLeft () => align(alignment: Alignment.bottomLeft);

}
