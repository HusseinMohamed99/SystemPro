import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';

class ResultsCountAndSortButton extends StatefulWidget {
  const ResultsCountAndSortButton({super.key, required this.propertyLength});
  final String propertyLength;

  @override
  State<ResultsCountAndSortButton> createState() =>
      _ResultsCountAndSortButtonState();
}

class _ResultsCountAndSortButtonState extends State<ResultsCountAndSortButton> {
  late String selectedSort;

  List<String> sortOptions(BuildContext context) => [
    context.localization.newest,
    context.localization.price_low,
    context.localization.price_high,
  ];

  @override
  void initState() {
    super.initState();
    selectedSort = '';
  }

  @override
  Widget build(BuildContext context) {
    final allsortOptions = sortOptions(context);
    if (selectedSort.isEmpty) {
      selectedSort = context.localization.newest;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.propertyLength} ${context.localization.properties}',
          style: context.titleMedium?.copyWith(
            color: ColorManager.softGray,
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
              if (value == context.localization.newest) {
              } else if (value == context.localization.price_low) {
              } else if (value == context.localization.price_high) {
              }
              context.read<MarketplaceCubit>().sortListings(
                sortType: value,
                newest: context.localization.newest,
                priceLow: context.localization.price_low,
                priceHigh: context.localization.price_high,
              );
            },

            itemBuilder: (context) {
              return allsortOptions.map((option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(
                    option,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                    ),
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
