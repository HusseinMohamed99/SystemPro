import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/logic/MarketPlace/marketplace_cubit.dart';

/// A widget to display results count and a sort button with options
/// A widget to display total results count and sorting options.
class ResultsCountAndSortButton extends StatelessWidget {
  const ResultsCountAndSortButton({
    super.key,
    required this.propertiesCount,
    required this.selectedSort,
    required this.sortOptions,
    required this.onSortSelected,
  });

  final String propertiesCount;
  final SortType selectedSort;
  final List<SortOptionModel> sortOptions;
  final void Function(SortType) onSortSelected;

  @override
  Widget build(BuildContext context) {
    final localization = context.localization;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$propertiesCount ${localization.properties}',
          style: context.titleMedium?.copyWith(
            color: customSoftAndIconGreyColor(context),
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: kPaddingDefaultHorizontal.w,
            vertical: kPaddingSmallVertical.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: customBorderGreyAndTertiaryBlackColor(context),
            ),
            borderRadius: BorderRadius.circular(kBorderRadiusMedium.r),
            color: customWhiteAndTertiaryBlackColor(context),
          ),
          child: PopupMenuButton<SortType>(
            color: customWhiteAndTertiaryBlackColor(context),
            onSelected: onSortSelected,
            itemBuilder:
                (context) => [
                  PopupMenuItem<SortType>(
                    value: SortType.reset,
                    child: Text(localization.reset_sort),
                  ),
                  ...sortOptions.map((option) {
                    final isSelected = selectedSort == option.sortType;
                    return PopupMenuItem<SortType>(
                      value: option.sortType,
                      child: Row(
                        children: [
                          if (isSelected)
                            Icon(
                              Icons.radio_button_checked,
                              size: kIconSizeMedium.sp,
                              color: ColorManager.primaryBlue,
                            )
                          else
                            horizontalSpacing(kSpacingDefault),
                          horizontalSpacing(kSpacingSmall),
                          Text(option.label),
                        ],
                      ),
                    );
                  }),
                ],
            child: Row(
              children: [
                Icon(
                  Icons.swap_vert,
                  size: kIconSizeDefault.sp,
                  color: customSoftAndHintGreyColor(context),
                ),
                horizontalSpacing(kSpacingSmaller),
                Text(
                  sortOptions
                      .firstWhere(
                        (e) => e.sortType == selectedSort,
                        orElse:
                            () => SortOptionModel(
                              label: '',
                              sortType: SortType.reset,
                            ),
                      )
                      .label,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.regular,
                    color: customSoftAndHintGreyColor(context),
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
