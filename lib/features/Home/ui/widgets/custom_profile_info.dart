import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const String name = 'Hossam Elshabrawy';
    return Row(
      spacing: kSpacingDefault.w,
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
              name.substring(0, 1).toUpperCase(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: kSpacingDefault.h,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'hossamelshabrawy@example.com',
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
