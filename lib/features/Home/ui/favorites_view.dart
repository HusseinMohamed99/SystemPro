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
import 'package:system_pro/gen/assets.gen.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            context.localization.favorites,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: ColorManager.primaryBlue,
            ),
          ),
        ),
        verticalSpacing(kSpacingLarge),
        const Divider(color: ColorManager.borderGrey),
        verticalSpacing(kSpacingXLarge),
        Expanded(
          child: const CustomScrollView(
            slivers: [SliverToBoxAdapter(child: RealEstateItem())],
          ).hPadding(kPaddingDefaultHorizontal.w),
        ),
      ],
    ).vPadding(kPaddingDefaultVertical.h);
  }
}

class RealEstateItem extends StatelessWidget {
  const RealEstateItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: ColorManager.borderGrey, width: 1.5.w),
          color: ColorManager.pureWhite,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RealEstateImageSlider(),
            verticalSpacing(kSpacingSmall),
            const RealEstateInfo(),
          ],
        ),
      ),
    );
  }
}

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
        Row(
          children: [
            Text(
              'Area',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: ColorManager.softGray,
              ),
            ),
            // const Spacer(),
            SvgPicture.asset(Assets.images.image2),
          ],
        ),
      ],
    ).hPadding(kPaddingHorizontal.w);
  }
}

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

class RealEstateImageSlider extends StatelessWidget {
  const RealEstateImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,

      child: Image.asset(
        Assets.images.image1.path,
        fit: BoxFit.fitHeight,
        width: context.width,
        height: 150.h,
      ),
    );
  }
}
