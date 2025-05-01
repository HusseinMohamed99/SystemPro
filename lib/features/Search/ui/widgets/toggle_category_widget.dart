import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class ToggleCategoryWidget extends StatefulWidget {
  const ToggleCategoryWidget({super.key});

  @override
  State<ToggleCategoryWidget> createState() => _ToggleCategoryWidgetState();
}

class _ToggleCategoryWidgetState extends State<ToggleCategoryWidget> {
  late String selectedFilter;

  List<String> filters(BuildContext context) => [
    context.localization.residentail,
    context.localization.commercial,
  ];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedFilter =
        context.localization.residentail; // ✅ استخدم context هنا بأمان
  }

  @override
  Widget build(BuildContext context) {
    final allFilters = filters(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorManager.shadowBlue,
      ),

      child: Row(
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
                        selectedFilter == context.localization.rent &&
                                isSelected
                            ? 8.w
                            : 0,
                  ),
                  child: ChoiceChip(
                    side: BorderSide.none,
                    labelPadding: EdgeInsets.symmetric(vertical: 2.h),
                    label: SizedBox(
                      width: double.infinity,
                      child: Text(
                        filter,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color:
                              isSelected
                                  ? ColorManager.pureWhite
                                  : ColorManager.primaryBlue,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    selectedColor: ColorManager.primaryBlue,
                    backgroundColor: ColorManager.shadowBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(color: ColorManager.borderGrey),
                    ),
                    showCheckmark: false,
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
