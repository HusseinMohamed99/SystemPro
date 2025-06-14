import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';

class RealEstateCountBedAndBathRoom extends StatelessWidget {
  const RealEstateCountBedAndBathRoom({
    super.key,
    required this.bedroomNum,
    required this.bathroomNum,
    required this.area,
  });

  final String bedroomNum, bathroomNum, area;
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
              final values = [bedroomNum, bathroomNum, '$area sqm'];
              return Row(
                children: [
                  SvgPicture.asset(
                    images[index],
                    colorFilter: ColorFilter.mode(
                      customSoftAndIconGreyColor(context),
                      BlendMode.srcIn,
                    ),
                  ),

                  horizontalSpacing(kSpacingSmall.w),
                  Text(
                    values[index],
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: customSoftAndIconGreyColor(context),
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
