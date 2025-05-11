import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/logic/marketplace_cubit.dart';

class PropertyFiltersRow extends StatefulWidget {
  const PropertyFiltersRow({super.key});

  @override
  State<PropertyFiltersRow> createState() => _PropertyFiltersRowState();
}

class _PropertyFiltersRowState extends State<PropertyFiltersRow> {
  late String selectedFilter;

  List<String> filters(BuildContext context) => [
    context.localization.buy,
    context.localization.rent,
    context.localization.book,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedFilter = context.localization.buy;
  }

@override
Widget build(BuildContext context) {
  final allFilters = filters(context);
  return Row(
    children: allFilters.map((filter) {
      final isSelected = selectedFilter == filter;
      return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w), 
          child: ChoiceChip(
            labelPadding: EdgeInsets.symmetric(vertical: 2.h),
            label: SizedBox(
              width: double.infinity,
              child: Text(
                filter,
                textAlign: TextAlign.center,
                style: context.titleLarge?.copyWith(
                  color: isSelected
                      ? ColorManager.primaryBlue
                      : ColorManager.softGray,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
            selected: isSelected,
            onSelected: (_) {
              setState(() {
                selectedFilter = filter;
              });
              context.read<MarketplaceCubit>().filterListings(
                filter.toLowerCase(),
              );
            },
            selectedColor: ColorManager.shadowBlue,
            backgroundColor: ColorManager.pureWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: ColorManager.borderGrey),
            ),
            showCheckmark: false,
          ),
        ),
      );
    }).toList(),
  );
}

}