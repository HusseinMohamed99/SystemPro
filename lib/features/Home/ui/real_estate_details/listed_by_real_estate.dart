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
class ListedByWidget extends StatelessWidget {
  const ListedByWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.listed_by,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: kSpacingXLarge.h),
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ColorManager.borderGrey, width: 1.5.w),
          ),
          child: Column(
            spacing: kSpacingDefault.h,
            children: [
              Image.asset(
                Assets.images.image2Png.path,
                width: 120.w,
                height: 40.h,
                fit: BoxFit.fitHeight,
              ),
              Text(
                'Mastermind Real estate',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              Divider(
                color: ColorManager.borderGrey,
                thickness: 1.5.w,
              ).hPadding(kSpacingDefault.w),
              GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.companyProfileView);
                },
                child: Text(
                  context.localization.view_profile,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: ColorManager.primaryBlue,
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
