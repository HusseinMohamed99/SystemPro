import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
    required this.isLocalization,
    required this.title,
    required this.language,
    required this.isThemeMode,
    required this.themeMode,
    this.onTap,
  });
  final bool isLocalization, isThemeMode;
  final String title, language, themeMode;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: context.width,
          color: Colors.transparent,
          padding: EdgeInsetsDirectional.symmetric(vertical: kSpacingXLarge.h),
          child: Row(
            children: [
              Text(
                title,
                style: context.titleLarge?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              const Spacer(),
              if (isLocalization || isThemeMode)
                Row(
                  spacing: kSpacingSmall.w,
                  children: [
                    Text(
                      isLocalization ? language : themeMode,
                      style: context.titleMedium?.copyWith(
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: customBlackAndWhiteColor(context),
                      size: kIconSizeSecondary.sp,
                    ),
                  ],
                )
              else
                Icon(
                  Icons.arrow_forward_ios,
                  color: customBlackAndWhiteColor(context),
                  size: kIconSizeSecondary.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
