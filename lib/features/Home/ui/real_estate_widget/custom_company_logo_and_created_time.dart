import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/functions/time_ago.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';

class CustomCompanyLogoAndCratedTime extends StatelessWidget {
  const CustomCompanyLogoAndCratedTime({
    super.key,
    required this.dateTime,
    required this.companyImage,
  });

  final String dateTime, companyImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          timeAgo(dateTime),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
            color: ColorManager.softGray,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.companyProfileView);
          },
          child: CustomCachedNetworkImageWidget(
            height: 32.h,
            width: 100.w,
            fit: BoxFit.fill,
            imageURL: companyImage,
          ),
        ),
      ],
    );
  }
}
