import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class BottomNavItemActive extends StatelessWidget {
  const BottomNavItemActive({
    super.key,
    required this.icon,
    required this.title,
  });
  final String icon, title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: kPaddingDefaultHorizontal.w),
        decoration: ShapeDecoration(
          color: ColorManager.primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30).r,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: ColorManager.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30).r,
                ),
              ),
              child: Center(child: SvgPicture.asset(icon)),
            ),
            horizontalSpacing(kSpacingSmaller),
            Text(
              title,
              // style: TextStyleManager.semiBold11(
              //   context: context,
              // ).copyWith(color: ColorManager.primaryGreen),
            ),
          ],
        ),
      ),
    );
  }
}
