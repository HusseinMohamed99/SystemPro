import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';

/// A widget to display results count and a sort button with options
class ResultsCountAndSortButton extends StatelessWidget {
  const ResultsCountAndSortButton({super.key, required this.propertyLength});
  final String propertyLength;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MarketplaceCubit>();

    // ✅ Ensure sort options are initialized before accessing them
    cubit.initSortOptionsIfNeeded(context);

    final currentSort = cubit.selectedSort;
    final sortOptions = cubit.sortOptions;
    final localization = context.localization;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Display count of properties found
        Text(
          '$propertyLength ${localization.properties}',
          style: context.titleMedium?.copyWith(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGray,
              darkColor: ColorManager.iconGrey,
            ),
            fontWeight: FontWeightHelper.medium,
          ),
        ),

        // Sort dropdown with options
        Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: kPaddingDefaultHorizontal.w,
            vertical: kPaddingSmallVertical.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.borderGrey,
                darkColor: ColorManager.tertiaryBlack,
              ),
              width: 1.5.w,
            ),
            borderRadius: BorderRadius.circular(8),
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.pureWhite,
              darkColor: ColorManager.tertiaryBlack,
            ),
          ),
          child: PopupMenuButton<SortType>(
            // Background color for the popup
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.pureWhite,
              darkColor: ColorManager.tertiaryBlack,
            ),

            // When an item is selected
            onSelected: cubit.sortListings,

            // Menu items
            itemBuilder: (context) {
              if (sortOptions.isEmpty) return []; // 🧯 أمان ضد التفريغ

              return [
                PopupMenuItem<SortType>(
                  value: SortType.reset,
                  child: Text(localization.reset_sort),
                ),
                ...sortOptions.map((option) {
                  final isSelected = currentSort == option.sortType;

                  return PopupMenuItem<SortType>(
                    value: option.sortType,
                    child: Row(
                      children: [
                        if (isSelected)
                          Icon(
                            Icons.radio_button_checked,
                            size: 16.sp,
                            color: ColorManager.primaryBlue,
                          )
                        else
                          horizontalSpacing(kSpacingDefault),

                        horizontalSpacing(kSpacingSmall),

                        Text(
                          option.label,
                          style: context.titleMedium?.copyWith(
                            fontWeight: FontWeightHelper.regular,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ];
            },

            // Displayed child widget for button
            child: Row(
              children: [
                Icon(
                  Icons.swap_vert,
                  size: kIconSizeDefault.sp,
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.softGray,
                    darkColor: ColorManager.hintGrey,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  cubit.getLabelForSort(currentSort),
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.regular,
                    color: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.softGray,
                      darkColor: ColorManager.hintGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
