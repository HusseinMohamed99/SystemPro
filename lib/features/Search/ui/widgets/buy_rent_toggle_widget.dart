import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class BuyRentToggleWidget extends StatefulWidget {
  const BuyRentToggleWidget({
    super.key,
    required this.filtersToggle,
    required this.onToggleChanged,
  });

  final Map<String, String> filtersToggle;
  final void Function(String selectedValue) onToggleChanged;

  @override
  State<BuyRentToggleWidget> createState() => _BuyRentToggleWidgetState();
}

class _BuyRentToggleWidgetState extends State<BuyRentToggleWidget> {
  late String selectedFilter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedFilter = widget.filtersToggle.values.first;
  }

  @override
  Widget build(BuildContext context) {
    final allFilters = widget.filtersToggle;

    return Row(
      children:
          allFilters.keys.map((filter) {
            final value = allFilters[filter]!;
            final isSelected = selectedFilter == value;

            return Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
                child: ChoiceChip(
                  labelPadding: EdgeInsetsDirectional.symmetric(vertical: 2.h),
                  label: SizedBox(
                    width: double.infinity,
                    child: Text(
                      filter,
                      textAlign: TextAlign.center,
                      style: context.titleLarge?.copyWith(
                        color:
                            isSelected
                                ? AdaptiveColor.adaptiveColor(
                                  context: context,
                                  lightColor: ColorManager.primaryBlue,
                                  darkColor: ColorManager.pureWhite,
                                )
                                : AdaptiveColor.adaptiveColor(
                                  context: context,
                                  lightColor: ColorManager.softGray,
                                  darkColor: ColorManager.hintGrey,
                                ),
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedFilter = value;
                    });
                    widget.onToggleChanged(value);
                  },
                  selectedColor: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.shadowBlue,
                    darkColor: ColorManager.primaryBlue,
                  ),
                  backgroundColor: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.pureWhite,
                    darkColor: ColorManager.tertiaryBlack,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.shadowBlue,
                        darkColor: ColorManager.tertiaryBlack,
                      ),
                    ),
                  ),
                  showCheckmark: false,
                ),
              ),
            );
          }).toList(),
    );
  }
}
