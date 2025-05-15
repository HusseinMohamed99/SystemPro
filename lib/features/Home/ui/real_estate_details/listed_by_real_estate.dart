import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/company.dart';
class ListedByWidget extends StatelessWidget {
  const ListedByWidget({super.key, required this.company});
  final Company company;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.listed_by,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.symmetric(vertical: kSpacingXLarge.h),
          width: context.width,
          decoration: BoxDecoration(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.pureWhite,
              darkColor: ColorManager.tertiaryBlack,
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.borderGrey,
                darkColor: ColorManager.tertiaryBlack,
              ),
              width: 1.5.w,
            ),
          ),
          child: Column(
            spacing: kSpacingDefault.h,
            children: [
              CustomCachedNetworkImageWidget(
                imageURL: company.picture,
                width: 120.w,
                height: 40.h,
                fit: BoxFit.fitHeight,
              ),
              Text(
                company.name ?? '',
                style: context.titleLarge?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              const CustomDivider().hPadding(kSpacingDefault.w),
              GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.companyProfileView,
                    arguments: company,
                  );
                },
                child: Text(
                  context.localization.view_profile,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.primaryBlue,
                      darkColor: ColorManager.secondaryBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
