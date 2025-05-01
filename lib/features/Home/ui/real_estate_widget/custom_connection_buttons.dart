
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';
class CustomConnectionButton extends StatelessWidget {
  const CustomConnectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: kSpacingDefault.w,
      children: [
        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: kPaddingMediumVertical.h),
              backgroundColor: ColorManager.shadowBlue,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            icon: SvgPicture.asset(Assets.images.whatsapp),
            label: Text(
              context.localization.whatsApp,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
        ),

        Expanded(
          child: TextButton.icon(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: kPaddingMediumVertical.h),
              backgroundColor: ColorManager.shadowBlue,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            icon: SvgPicture.asset(Assets.images.phone),
            label: Text(
              context.localization.call,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
