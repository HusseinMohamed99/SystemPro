import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Adds vertical space using responsive height.
SizedBox verticalSpacing(double height) => SizedBox(height: height.h);

/// Adds horizontal space using responsive width.
SizedBox horizontalSpacing(double width) => SizedBox(width: width.w);
