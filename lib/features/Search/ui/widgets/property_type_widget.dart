import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({super.key});

  @override
  State<PropertyTypeWidget> createState() => _PropertyTypeWidgetState();
}

class _PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  final List<String> allPropertyTypes = [
    'Apartment',
    'Villa',
    'Townhouse',
    'Penthouse',
    'Duplex',
    'Compound',
    'Studio',
    'Loft',
  ];

  final Set<String> selectedTypes = {};
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    final typesToShow =
        showAll ? allPropertyTypes : allPropertyTypes.take(5).toList();

    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.localization.property_type,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Wrap(
          spacing: 8,
          children:
              typesToShow.map((type) {
                return FilterChip(
                  showCheckmark: false,
                  label: Text(type),
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
        if (allPropertyTypes.length > 5)
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
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
                color: ColorManager.primaryBlue,
              ),
            ),
          ),
      ],
    );
  }
}
