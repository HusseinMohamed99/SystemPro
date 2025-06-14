import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/functions/filters.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class BuyRentToggleWidget extends StatefulWidget {
  const BuyRentToggleWidget({
    super.key,
    required this.filtersToggle,
    required this.onToggleChanged,
  });
  final List<FilterToggle> filtersToggle;
  final void Function(String selectedValue) onToggleChanged;
  @override
  State<BuyRentToggleWidget> createState() => _BuyRentToggleWidgetState();
}

class _BuyRentToggleWidgetState extends State<BuyRentToggleWidget> {
  late String selectedValue;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedValue = filterToggleValue(widget.filtersToggle.first);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          widget.filtersToggle.map((toggle) {
            final label = filterToggleLabel(context, toggle);
            final value = filterToggleValue(toggle);
            final isSelected = selectedValue == value;
            return Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 4.w),
                child: ChoiceChip(
                  labelPadding: EdgeInsetsDirectional.symmetric(vertical: 2.h),
                  label: SizedBox(
                    width: double.infinity,
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: context.titleLarge?.copyWith(
                        color:
                            isSelected
                                ? customPrimaryBlueAndWhiteColor(context)
                                : customSoftAndHintGreyColor(context),
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() => selectedValue = value);
                    widget.onToggleChanged(value);
                  },
                  selectedColor: customShadowAndPrimaryBlueColor(context),
                  backgroundColor: customWhiteAndTertiaryBlackColor(context),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: customShadowBlueAndTertiaryBlackColor(context),
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
