import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class CsutomProfileCard extends StatelessWidget {
  const CsutomProfileCard({
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.pureBlack,
                        darkColor: ColorManager.pureWhite,
                      ),
                      size: 20.sp,
                    ),
                  ],
                )
              else
                Icon(
                  Icons.arrow_forward_ios,
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.pureBlack,
                    darkColor: ColorManager.pureWhite,
                  ),
                  size: 20.sp,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
