import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/gen/assets.gen.dart';
class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.amenities,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Wrap(
          spacing: kSpacingXLarge.w,
          runSpacing: kSpacingSmall.h,
          children: List.generate(4, (index) {
            final strings = [
              'Central A/C',
              'Security',
              'Swimming Pool',
              'Garden',
            ];
            return SizedBox(
              width: context.width * 0.40,
              child: Text(
                strings[index],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
