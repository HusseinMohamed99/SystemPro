import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});
  final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.location,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        verticalSpacing(kSpacingSmall),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.pureBlack,
                darkColor: ColorManager.iconGrey,
              ),
              size: kIconSizeDefault.sp,
            ),
            Text(
              location,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
