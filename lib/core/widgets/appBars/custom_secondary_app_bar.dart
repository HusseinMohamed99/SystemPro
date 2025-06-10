import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/widgets/buttons/custom_back_button.dart';

/// A reusable, adaptive secondary AppBar widget
AppBar customSecondaryAppBar(
  BuildContext context, {
  VoidCallback? onBackPress,
  String? title,
  Color? textColor,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: customPureWhiteAndBlackColor(context),
    elevation: 0,
    centerTitle: true,
    leadingWidth: 72.w, // Leading width that ensures padding + icon
    leading: Padding(
      padding: EdgeInsetsDirectional.only(start: kSpacingLarge.w),
      child: CustomBackButton(context: context, onBackPress: onBackPress),
    ),
    actions: actions,
    title:
        (title?.isNotEmpty == true)
            ? Text(
              title!,
              textAlign: TextAlign.center,
              style: context.headlineMedium?.copyWith(
                color: textColor ?? customPrimaryBlueAndWhiteColor(context),
              ),
            )
            : null, // Title only rendered if it's not empty
  );
}
