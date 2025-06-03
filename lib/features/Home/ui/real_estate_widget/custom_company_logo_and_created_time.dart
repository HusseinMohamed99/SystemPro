import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/helpers/functions/time_ago.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/images/custom_cached_network_image.dart';
import 'package:system_pro/features/Home/data/model/realestate/company.dart';
import 'package:system_pro/features/Home/data/model/realestate/marketer.dart';

/// Widget to display creation time and clickable company/marketer logo.
class CustomCompanyLogoAndCratedTime extends StatelessWidget {
  const CustomCompanyLogoAndCratedTime({
    super.key,
    required this.dateTime,
    required this.company,
    required this.marketer,
  });

  final String dateTime;
  final Company company;
  final Marketer marketer;

  @override
  Widget build(BuildContext context) {
    final bool isCompany = company.id != null;
    final int? id = isCompany ? company.id : marketer.id;
    final String? imageUrl =
        isCompany ? company.pictureUrl : marketer.pictureUrl;

    return Row(
      children: [
        // Display how long ago the listing was created
        Text(
          TimeAgoHelper.timeAgo(context, dateTime),
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

        // Display clickable logo image (company or marketer)
        if (id != null)
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.companyProfileView, arguments: id);
              AppLogs.log('Navigated to profile with ID: $id');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: CustomCachedNetworkImageWidget(
                height: 40.h,
                width: 40.w,
                fit: BoxFit.cover,
                imageURL: imageUrl ?? '',
              ),
            ),
          ),
      ],
    );
  }
}
