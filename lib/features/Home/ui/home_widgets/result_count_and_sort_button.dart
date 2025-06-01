import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
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

  /// Number of property listings displayed
  final String propertyLength;

  @override
  State<ResultsCountAndSortButton> createState() =>
      _ResultsCountAndSortButtonState();
}

class _ResultsCountAndSortButtonState extends State<ResultsCountAndSortButton> {
  /// Currently selected sort option
  late String selectedSort;

  /// Available localized sort options
  List<String> sortOptions(BuildContext context) => [
    context.localization.newest,
    context.localization.oldest,
    context.localization.price_low,
    context.localization.price_high,
  ];

  @override
  void initState() {
    super.initState();
    selectedSort = ''; // Will be replaced in build with default if needed
  }

  @override
  Widget build(BuildContext context) {
    final allSortOptions = sortOptions(context);

    // Fallback to default sort if not set
    if (selectedSort.isEmpty) {
      selectedSort = context.localization.newest;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Left side: result count text
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

        /// Right side: sort button with PopupMenu
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
          child: PopupMenuButton<String>(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.pureWhite,
              darkColor: ColorManager.tertiaryBlack,
            ),
            onSelected: (value) {
              setState(() {
                selectedSort = value;
              });

              // Trigger sort logic in MarketplaceCubit
              context.read<MarketplaceCubit>().sortListings(
                sortType: value,
                newest: context.localization.newest,
                priceLow: context.localization.price_low,
                priceHigh: context.localization.price_high,
                
              );
            },
            itemBuilder: (context) {
              return allSortOptions.map((option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Row(
                    children: [
                      // Show checkmark if current option is selected
                      if (option == selectedSort)
                        Icon(
                          Icons.check_box_sharp,
                           size: 16.sp,
                          color: ColorManager.primaryBlue,
                        )
                      else
                        horizontalSpacing(16), // Placeholder to align text

                      horizontalSpacing(8),

                      // Option text
                      Text(
                        option,
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
                  selectedSort,
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
