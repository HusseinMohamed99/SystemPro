import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class ResultsCountAndSortButton extends StatefulWidget {
  const ResultsCountAndSortButton({super.key});

  @override
  State<ResultsCountAndSortButton> createState() =>
      _ResultsCountAndSortButtonState();
}

class _ResultsCountAndSortButtonState extends State<ResultsCountAndSortButton> {
  String selectedSort = 'Newest';

  final List<String> sortOptions = [
    'Newest',
    'Price (Low)',
    'Price (High)',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1537 Properties',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ColorManager.softGray,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Container(
          padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.borderGrey, width: 1.5.w),
            borderRadius: BorderRadius.circular(8),
          ),
          child: PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                selectedSort = value;
              });
            },
            itemBuilder: (context) {
              return sortOptions.map((option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
            child: Row(
              children: [
                 Icon(Icons.swap_vert, size: kIconSizeDefault.sp,
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
