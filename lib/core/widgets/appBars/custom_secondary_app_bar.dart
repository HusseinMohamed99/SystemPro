import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
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
    automaticallyImplyLeading: false,
    actions: actions,
    title:
        (title?.isNotEmpty == true)
            ? Row(
              children: [
                CustomBackButton(context: context, onBackPress: onBackPress),
                Expanded(
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: context.headlineMedium?.copyWith(
                      color:
                          textColor ?? customPrimaryBlueAndWhiteColor(context),
                    ),
                  ),
                ),
              ],
            )
            : CustomBackButton(
              context: context,
              onBackPress: onBackPress,
            ).alignLeft(),
  );
}
