import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';


class RealEstateCountBedAndBathRoom extends StatelessWidget {
  const RealEstateCountBedAndBathRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(3, (index) {
              final images = [
                Assets.images.bed,
                Assets.images.bathroom,
                Assets.images.area,
              ];
              final values = ['3', '2', '176 sqm'];
              return Row(
                children: [
                  SvgPicture.asset(images[index]),
                  horizontalSpacing(kSpacingSmall.w),
                  Text(
                    values[index],
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: ColorManager.softGray,
                    ),
                  ),
                ],
              );
            })
            .expand((element) => [element, horizontalSpacing(kSpacingSmall.w)])
            .toList()
          ..removeLast(),
      ],
    );
  }
}
