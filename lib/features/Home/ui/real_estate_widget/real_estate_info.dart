import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_company_logo_and_created_time.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_count_bed_and_bathroom.dart';
import 'package:system_pro/gen/assets.gen.dart';

class RealEstateInfo extends StatelessWidget {
  const RealEstateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SAR 3,143,000',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: ColorManager.primaryBlue),
        ),
        Text(
          'Fully finished apartment 65m for sale in Madinaty',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),

        const RealEstateCountBedAndBathRoom(),
        Text(
          'Privado, Madinaty',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: ColorManager.softGray,
          ),
        ),
        const CustomCompanyLogoAndCratedTime(),
        Divider(
          color: ColorManager.borderGrey,
          height: 1.h,
        ).vPadding(kSpacingSmall.h),
        const CustomConnectionButton(),
      ],
    ).onlyPadding(
      leftPadding: kPaddingHorizontal,
      rightPadding: kPaddingHorizontal,
      bottomPadding: kPaddingVertical,
    );
  }
}
