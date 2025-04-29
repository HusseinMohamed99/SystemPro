import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';
class CustomCompanyLogoAndCratedTime extends StatelessWidget {
  const CustomCompanyLogoAndCratedTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '4 Days ago',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: ColorManager.softGray,
          ),
        ),
        const Spacer(),
        Image.asset(
          Assets.images.image2Png.path,
          height: 32.h,
          width: 100.w,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
