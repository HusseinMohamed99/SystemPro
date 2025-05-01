import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/ui/real_estate_widget/custom_connection_buttons.dart';
import 'package:system_pro/gen/assets.gen.dart';
class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.location,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeightHelper.medium),
        ),
        Row(
          children: [
            Icon(
              Icons.place_outlined,
              color: ColorManager.softGray,
              size: kIconSizeDefault.sp,
            ),
            Text(
              'Privado, Madinaty',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.regular,
                color: ColorManager.softGray,
              ),
            ),
          ],
        ),
        Container(
          width: context.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(Assets.images.map.path),
              Positioned(
                child: TextButton.icon(
                  style: TextButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {},
                  label: Text(
                    context.localization.see_location,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  icon: Icon(
                    Icons.place_outlined,
                    color: ColorManager.softGray,
                    size: kIconSizeDefault.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
