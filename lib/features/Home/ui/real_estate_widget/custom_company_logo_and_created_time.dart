import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/time_ago.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/company.dart';

class CustomCompanyLogoAndCratedTime extends StatelessWidget {
  const CustomCompanyLogoAndCratedTime({
    super.key,
    required this.dateTime,
    required this.company,
  });

  final String dateTime;
  final Company company;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          timeAgo(context, dateTime),
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGray,
              darkColor: ColorManager.hintGrey,
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.companyProfileView, arguments: company.id);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.r),
            child: CustomCachedNetworkImageWidget(
              height: 40.h,
              width: 40.w,
              fit: BoxFit.cover,
              imageURL: company.picture,
            ),
          ),
        ),
      ],
    );
  }
}
