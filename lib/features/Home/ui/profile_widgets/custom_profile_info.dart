import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = CachingHelper.getData<String>(SharedPrefKeys.name) ?? '';
    final userEmail = CachingHelper.getData<String>(SharedPrefKeys.email) ?? '';

    return Row(
      children: [
        Container(
          width: 88.w,
          height: 88.h,
          decoration: BoxDecoration(
            color: ColorManager.shadowBlue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              userName.isNotEmpty
                  ? userName.substring(0, 1).toUpperCase()
                  : '?',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
        SizedBox(width: kSpacingDefault.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                userEmail,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorManager.softGray,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
