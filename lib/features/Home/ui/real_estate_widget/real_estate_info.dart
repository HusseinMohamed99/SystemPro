import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/price_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/features/Home/data/model/realestate/listing.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_company_logo_and_created_time.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/real_estate_count_bed_and_bathroom.dart';

/// Displays detailed real estate info including price, title, location,
/// specs, company and contact options.
class RealEstateInfo extends StatelessWidget {
  const RealEstateInfo({super.key, required this.listing});

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 💰 Price with Saudi Riyal icon
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: listing.price?.formatPrice() ?? '',
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

        // 🏡 Title of the listing
        Text(
          listing.title ?? '',
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: customBlackAndHintGreyColor(context),
          ),
        ),

        // 🛏️ Bedrooms / Bathrooms / Area
        RealEstateCountBedAndBathRoom(
          bedroomNum: listing.rooms?.toString() ?? '',
          bathroomNum: listing.bathrooms?.toString() ?? '',
          area: listing.area ?? '',
        ),

        // 📍 Location
        Text(
          listing.location ?? '',
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: customSoftAndHintGreyColor(context),
          ),
        ),

        // 🕒 Time + company/marketer logo
        CompanyLogoAndCreatedTimeWidget(listing: listing),

        const AdaptiveDivider().vPadding(kSpacingSmall),

        // 📞 Call / WhatsApp buttons
        CustomConnectionButton(
          whatsAppURL: listing.company?.phone ?? '',
          phoneURL: listing.company?.phone ?? '',
        ),
      ],
    ).onlyPadding(
      leftPadding: kPaddingHorizontal,
      rightPadding: kPaddingHorizontal,
      bottomPadding: kPaddingVertical,
    );
  }
}
