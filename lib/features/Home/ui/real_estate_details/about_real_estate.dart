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
class AboutRealEstate extends StatelessWidget {
  const AboutRealEstate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingDefault.h,
      children: [
        Row(
          spacing: kSpacingDefault.w,
          children: [
            Text(
              '${context.localization.sar} 3,143,000',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
                color: ColorManager.primaryBlue,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ColorManager.borderGrey,
                  width: 1.5.w,
                ),
              ),
              child: Text(
                '20% Down Payment',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: ColorManager.softGray,
                ),
              ),
            ),
          ],
        ),
        Text(
          'Fully finished apartment 65m for sale in Madinaty',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: ColorManager.softGray,
              size: kIconSizeDefault.sp,
            ),
            Text(
              'Privado, Madinaty',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: ColorManager.softGray,
              ),
            ),
            const Spacer(),
            Text(
              '19/03/2025',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: ColorManager.softGray,
              ),
            ),
          ],
        ),
        Wrap(
          spacing: kSpacingDefault.w, // المسافة الأفقية بين العناصر
          runSpacing: kSpacingSmall.h, // المسافة الرأسية بين الأسطر
          children: List.generate(4, (index) {
            final images = [
              Assets.images.buildingApartment,
              Assets.images.bed,
              Assets.images.bathroom,
              Assets.images.area,
            ];
            final values = ['Apartment', '3', '2', '176 sqm'];

            return Row(
              mainAxisSize: MainAxisSize.min, // مهم لتجنب أخذ كل العرض
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
          }),
        ),
      ],
    );
  }
}
