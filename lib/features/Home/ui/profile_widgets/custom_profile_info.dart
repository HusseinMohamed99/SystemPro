import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({super.key, this.userName, this.email});
  final String? userName;
  final String? email;
  @override
  Widget build(BuildContext context) {
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
              userName != null && userName!.isNotEmpty
                  ? userName![0].substring(0, 1).toUpperCase()
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
                userName ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                email ?? '',
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
