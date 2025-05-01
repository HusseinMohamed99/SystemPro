import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class BuyRentToggleWidget extends StatefulWidget {
  const BuyRentToggleWidget({super.key});

  @override
  State<BuyRentToggleWidget> createState() => _BuyRentToggleWidgetState();
}

class _BuyRentToggleWidgetState extends State<BuyRentToggleWidget> {
  late String selectedFilter;

  List<String> filters(BuildContext context) => [
    context.localization.buy,
    context.localization.rent,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedFilter = context.localization.buy; // ✅ استخدم context هنا بأمان
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
                  side:
                      isSelected
                          ? BorderSide.none
                          : BorderSide(
                            color: ColorManager.borderGrey,
                            width: 1.5.w,
                          ),
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
