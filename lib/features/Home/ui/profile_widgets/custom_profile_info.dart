import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
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
            color: customShadowAndSecondaryBlueColor(context),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              userName != null && userName!.isNotEmpty
                  ? userName!.substring(0, 1).toUpperCase()
                  : '?',
              style: context.displaySmall?.copyWith(
                color: customPrimaryBlueAndWhiteColor(context),
              ),
            ),
          ),
        ),
        horizontalSpacing(kSpacingDefault),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.headlineSmall,
              ),
              Text(
                email ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.titleMedium?.copyWith(
                  color: customSoftAndHintGreyColor(context),
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
