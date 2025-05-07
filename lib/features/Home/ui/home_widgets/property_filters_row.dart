import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
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
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedFilter = context.localization.buy; // تعيين الفلتر الافتراضي
  }

  @override
  Widget build(BuildContext context) {
    final allFilters = filters(context);
    return Row(
      children:
          allFilters.map((filter) {
            final isSelected = selectedFilter == filter;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right:
                      selectedFilter == context.localization.buy && isSelected
                          ? 8.w
                          : 0,
                  left:
                      selectedFilter == context.localization.rent && isSelected
                          ? 8.w
                          : 0,
                ),
                child: ChoiceChip(
                  labelPadding: EdgeInsets.symmetric(vertical: 2.h),
                  label: SizedBox(
                    width: double.infinity,
                    child: Text(
                      filter,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color:
                            isSelected
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
                    // إرسال الفلتر إلى Cubit لتصفية العناصر
                    context.read<MarketplaceCubit>().filterListings(
                      filter.toLowerCase(), // تطبيق الفلتر بحروف صغيرة
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
