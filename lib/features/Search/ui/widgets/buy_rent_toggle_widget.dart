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
      children:
          allFilters.map((filter) {
            final isSelected = selectedFilter == filter;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w), // مسافة موحدة
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
