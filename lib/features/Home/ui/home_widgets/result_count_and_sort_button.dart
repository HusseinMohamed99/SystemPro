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

/// A row widget displaying the number of results and a sort menu button.
/// Allows the user to select how listings are sorted (newest, price low/high).
class ResultsCountAndSortButton extends StatefulWidget {
  const ResultsCountAndSortButton({super.key, required this.propertyLength});
  final String propertyLength;

  @override
  State<ResultsCountAndSortButton> createState() =>
      _ResultsCountAndSortButtonState();
}

class _ResultsCountAndSortButtonState extends State<ResultsCountAndSortButton> {
  /// النوع الحالي المختار للفرز
  late SortType selectedSort;

  @override
  void initState() {
    super.initState();
    selectedSort = SortType.newest; // Default
  }

  @override
  Widget build(BuildContext context) {
    final sortLabels = getSortLabels(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.propertyLength} ${context.localization.properties}',
          style: context.titleMedium?.copyWith(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGray,
              darkColor: ColorManager.iconGrey,
            ),
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
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.pureWhite,
              darkColor: ColorManager.tertiaryBlack,
            ),
            onSelected: (value) {
              setState(() {
                selectedSort = value;
              });

              // نفذ الفرز حسب النوع المختار
              context.read<MarketplaceCubit>().sortListings(value);
            },
            itemBuilder: (context) {
              return SortType.values.map((option) {
                return PopupMenuItem<SortType>(
                  value: option,
                  child: Row(
                    children: [
                      if (option == selectedSort)
                        Icon(
                          Icons.check_box_sharp,
                          size: 16.sp,
                          color: ColorManager.primaryBlue,
                        )
                      else
                        horizontalSpacing(16),

                      horizontalSpacing(8),

                      Text(
                        sortLabels[option]!,
                        style: context.titleMedium?.copyWith(
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList();
            },
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
                horizontalSpacing(4),
                Text(
                  sortLabels[selectedSort]!,
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

  Map<SortType, String> getSortLabels(BuildContext context) => {
    SortType.newest: context.localization.newest,
    SortType.oldest: context.localization.oldest,
    SortType.priceLow: context.localization.price_low,
    SortType.priceHigh: context.localization.price_high,
  };
}
