import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/features/Home/data/model/realestate/company.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketer.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_company_logo_and_created_time.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_count_bed_and_bathroom.dart';

/// Displays detailed real estate info including price, title, location,
/// specs, company and contact options.
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
    required this.marketer,
  });

  final String price, title, location, bedroomNum, bathroomNum, area, dateTime;
  final Company company;
  final Marketer marketer;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price with currency icon
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: price,
                style: context.titleLarge?.copyWith(
                  color: customPrimaryAndSecondaryBlueColor(context),
                ),
              ),
              TextSpan(
                text: ' \ue900',
                style: context.titleLarge?.copyWith(
                  fontFamily: FontFamilyHelper.saudiRiyal,
                  color: customPrimaryAndSecondaryBlueColor(context),
                ),
              ),
            ],
          ),
        ),

        // Title / Name
        Text(
          title,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: customBlackAndHintGreyColor(context),
          ),
        ),

        // Property specs: bedrooms, bathrooms, area
        RealEstateCountBedAndBathRoom(
          bedroomNum: bedroomNum,
          bathroomNum: bathroomNum,
          area: area,
        ),

        // Location info
        Text(
          location,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: customSoftAndHintGreyColor(context),
          ),
        ),

        // Company + time
        CustomCompanyLogoAndCratedTime(
          dateTime: dateTime,
          company: company,
          marketer: marketer,
        ),

        // Divider
        const AdaptiveDivider().vPadding(kSpacingSmall),

        // Contact Buttons
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
