import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

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
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedSort = context.localization.newest; // ✅ استخدم context هنا بأمان
  }
  @override
  Widget build(BuildContext context) {
        final allsortOptions = sortOptions(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.propertyLength} ${context.localization.properties}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.softGray,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kPaddingDefaultHorizontal.w,
            vertical: kPaddingSmallVertical.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.borderGrey, width: 1.5.w),
            borderRadius: BorderRadius.circular(8),
          ),
          child: PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedSort= value;
              });
            },
            itemBuilder: (context) {
              return allsortOptions.map((option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
            child: Row(
              children: [
                Icon(
                  Icons.swap_vert,
                  size: kIconSizeDefault.sp,
                  color: ColorManager.softGray,
                ),
                horizontalSpacing(4),
                Text(selectedSort),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
