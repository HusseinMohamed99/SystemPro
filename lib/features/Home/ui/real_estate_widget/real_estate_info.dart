import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_company_logo_and_created_time.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_count_bed_and_bathroom.dart';

class RealEstateInfo extends StatelessWidget {
  const RealEstateInfo({
    super.key,
    required this.price,
    required this.title,
    required this.location,
    required this.bedroomNum,
    required this.bathroomNum,
    required this.area,
    required this.dateTime,
    required this.company,
  });
  final String price, title, location, bedroomNum, bathroomNum, area, dateTime;
  final Company company;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: price,
                style: context.titleLarge?.copyWith(
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.primaryBlue,
                    darkColor: ColorManager.secondaryBlue,
                  ),
                ),
              ),
              TextSpan(
                text: ' \ue900',
                style: context.titleLarge?.copyWith(
                  fontFamily: FontFamilyHelper.saudiRiyal,
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.primaryBlue,
                    darkColor: ColorManager.secondaryBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          title,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.pureBlack,
              darkColor: ColorManager.hintGrey,
            ),
          ),
        ),
        RealEstateCountBedAndBathRoom(
          bedroomNum: bedroomNum,
          bathroomNum: bathroomNum,
          area: area,
        ),
        Text(
          location,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGray,
              darkColor: ColorManager.hintGrey,
            ),
          ),
        ),
        CustomCompanyLogoAndCratedTime(dateTime: dateTime, company: company),
        const CustomDivider().vPadding(kSpacingSmall),
        CustomConnectionButton(
          whatsAppURL: company.phone ?? '',
          phoneURL: company.phone ?? '',
        ),
      ],
    ).onlyPadding(
      leftPadding: kPaddingHorizontal,
      rightPadding: kPaddingHorizontal,
      bottomPadding: kPaddingVertical,
    );
  }
}
