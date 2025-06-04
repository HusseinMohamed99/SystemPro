import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/functions/time_ago.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_family.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';

class AboutRealEstate extends StatelessWidget {
  const AboutRealEstate({
    super.key,
    required this.price,
    required this.downPayment,
    required this.title,
    required this.location,
    required this.date,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.subcategory,
  });
  final String price,
      downPayment,
      title,
      location,
      date,
      bedrooms,
      bathrooms,
      area,
      subcategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: price,
                      style: context.headlineMedium?.copyWith(
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
            ),
            Container(
              padding: const EdgeInsetsDirectional.all(6),
              decoration: BoxDecoration(
                color: customWhiteAndTertiaryBlackColor(context),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: customBorderGreyAndTertiaryBlackColor(context),
                  width: 1.5.w,
                ),
              ),
              child: Text(
                '% $downPayment ${context.localization.down_payment}',
                style: context.titleSmall?.copyWith(
                  fontWeight: FontWeightHelper.medium,
               color: customSoftAndHintGreyColor(context),
                ),
              ),
            ),
          ],
        ),
        Text(
          title,
          textAlign: TextAlign.start,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
            color: customBlackAndHintGreyColor(context),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: customSoftAndIconGreyColor(context),
              size: kIconSizeDefault.sp,
            ),
            Expanded(
              child: Text(
                location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                  color: customSoftAndIconGreyColor(context),
                ),
              ),
            ),
            horizontalSpacing(kSpacingSmall),
            Text(
              TimeAgoHelper.timeAgo(context, date),
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: customSoftAndIconGreyColor(context),
              ),
            ),
          ],
        ),
        Wrap(
          spacing: kSpacingDefault.w,
          runSpacing: kSpacingSmall.h,
          children: List.generate(4, (index) {
            final images = [
              Assets.images.buildingApartment,
              Assets.images.bed,
              Assets.images.bathroom,
              Assets.images.area,
            ];
            final values = [subcategory, bedrooms, bathrooms, '$area sqm'];
            return Row(
              mainAxisSize: MainAxisSize.min,
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
          }),
        ),
      ],
    );
  }
}
