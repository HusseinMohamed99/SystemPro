import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/url_launcher.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';

class LocationRealEstate extends StatelessWidget {
  const LocationRealEstate({super.key, required this.location});

  final String location;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.location,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        verticalSpacing(kSpacingSmall),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.pureBlack,
                darkColor: ColorManager.iconGrey,
              ),
              size: kIconSizeDefault.sp,
            ),
            Text(
              location,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
            ),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(Assets.images.map.path, height: 200.h, width: context.width),
            PositionedDirectional(
              child: GestureDetector(
                onTap: () {
                  launchUrlWithPermission(
                    context: context,
                    url:
                        'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(location)}',
                    requiredPermission: Permission.location,
                  );
                },
                child: Container(
                  width: context.width * 0.4,
                  height: kButtonHeightPrimary.h,
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    color: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.pureWhite,
                      darkColor: ColorManager.tertiaryBlack,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.softGray,
                          darkColor: ColorManager.iconGrey,
                        ),
                        size: kIconSizeDefault.sp,
                      ),
                      Text(
                        context.localization.see_location,
                        textAlign: TextAlign.center,
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
