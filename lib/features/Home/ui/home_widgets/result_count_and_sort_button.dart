import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
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
    selectedSort = ''; // ستُحدد لاحقاً في build لو فارغة
  }

  @override
  Widget build(BuildContext context) {
    final allsortOptions = sortOptions(context);

    // في حالة عدم تحديد القيمة في البداية، يتم تعيين القيمة الافتراضية
    if (selectedSort.isEmpty) {
      selectedSort = context.localization.newest;
    }

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
                selectedSort = value;
              });

              // إرسال القيمة المختارة إلى cubit لترتيب البيانات
              String sortType = '';
              if (value == context.localization.newest) {
                sortType = context.localization.newest;
              } else if (value == context.localization.price_low) {
                sortType = context.localization.price_low;
              } else if (value == context.localization.price_high) {
                sortType = context.localization.price_high;
              }

              // إرسال القيمة المختارة إلى cubit لترتيب البيانات مع القيم المترجمة
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
