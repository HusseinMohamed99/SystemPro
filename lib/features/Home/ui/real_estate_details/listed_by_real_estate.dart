import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/realestate/company.dart';

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
            color: customWhiteAndTertiaryBlackColor(context),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: customBorderGreyAndTertiaryBlackColor(context),
              width: 1.5.w,
            ),
          ),
          child: Column(
            spacing: kSpacingDefault.h,
            children: [
              CustomCachedNetworkImageWidget(
                imageURL: company.pictureUrl,
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
              const AdaptiveDivider().hPadding(kSpacingDefault.w),
              GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.sourceProfileView,
                    arguments: company.id,
                  );
                },
                child: Text(
                  context.localization.view_profile,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: customPrimaryAndSecondaryBlueColor(context),
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
