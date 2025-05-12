import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/calculate_percentage.dart';
import 'package:system_pro/core/helpers/functions/time_ago.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
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
          spacing: kSpacingDefault.w,
          children: [
            Text(
              '${context.localization.sar} $price',
              style: context.headlineMedium?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
                color: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.primaryBlue,
                  darkColor: ColorManager.secondaryBlue,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.pureWhite,
                  darkColor: ColorManager.tertiaryBlack,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.borderGrey,
                    darkColor: ColorManager.tertiaryBlack,
                  ),
                  width: 1.5.w,
                ),
              ),
              child: Text(
                '${calculatePercentage(price, downPayment)} Down Payment',
                style: context.titleSmall?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.softGray,
                    darkColor: ColorManager.hintGrey,
                  ),
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
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.primaryBlack,
              darkColor: ColorManager.hintGrey,
            ),
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.softGray,
                darkColor: ColorManager.iconGrey,
              ),
              size: kIconSizeDefault.sp,
            ),
            Flexible(
              child: Text(
                location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.softGray,
                    darkColor: ColorManager.iconGrey,
                  ),
                ),
              ),
            ),
            horizontalSpacing(kSpacingSmall),
            Text(
              timeAgo(context, date),
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.softGray,
                  darkColor: ColorManager.iconGrey,
                ),
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
                    AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.softGray,
                      darkColor: ColorManager.iconGrey,
                    ),
                    BlendMode.srcIn,
                  ),
                ),
                horizontalSpacing(kSpacingSmall.w),
                Text(
                  values[index],
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.softGray,
                      darkColor: ColorManager.iconGrey,
                    ),
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
