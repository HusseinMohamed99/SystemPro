import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({super.key, required this.propertyTypes});

  final List<String> propertyTypes;

  @override
  State<PropertyTypeWidget> createState() => PropertyTypeWidgetState();
}

class PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  final Set<String> selectedTypes = {};
  bool showAll = false;

  void clearSelection() {
    setState(selectedTypes.clear);
  }

  @override
  Widget build(BuildContext context) {
    final typesToShow =
        showAll ? widget.propertyTypes : widget.propertyTypes.take(5).toList();

    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.localization.property_type,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Wrap(
          spacing: 8,
          children:
              typesToShow.map((type) {
                final isSelected = selectedTypes.contains(type);
                return FilterChip(
                  showCheckmark: false,
                  label: Text(
                    type,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color:
                          isSelected
                              ? ColorManager.pureWhite
                              : ColorManager.softGray,
                    ),
                  ),
                  selectedColor: ColorManager.primaryBlue,
                  backgroundColor: ColorManager.pureWhite,
                  side:
                      isSelected
                          ? BorderSide.none
                          : const BorderSide(color: ColorManager.borderGrey),
                  selected: selectedTypes.contains(type),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedTypes.add(type);
                      } else {
                        selectedTypes.remove(type);
                      }
                    });
                  },
                );
              }).toList(),
        ),
        if (widget.propertyTypes.length > 5)
          GestureDetector(
            onTap: () {
              setState(() {
                showAll = !showAll;
              });
            },
            child: Text(
              showAll
                  ? context.localization.show_less
                  : context.localization.see_more_property_type,
              textAlign: TextAlign.center,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
                color: ColorManager.primaryBlue,
              ),
            ),
          ),
      ],
    );
  }
}
