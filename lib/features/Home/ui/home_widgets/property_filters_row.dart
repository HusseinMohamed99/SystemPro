import 'package:flutter/material.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class PropertyFiltersRow extends StatefulWidget {
  const PropertyFiltersRow({super.key});

  @override
  State<PropertyFiltersRow> createState() => _PropertyFiltersRowState();
}

class _PropertyFiltersRowState extends State<PropertyFiltersRow> {
  final List<String> filters = ['Residential', 'Buy', 'Property type', 'Rooms'];
  final Set<String> selectedFilters = {'Residential', 'Buy'};

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            filters.map((filter) {
              final isSelected = selectedFilters.contains(filter);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  showCheckmark: false, // ⛔️ تمنع ظهور أيقونة الصح
                  label: Text(
                    filter,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color:
                          isSelected
                              ? ColorManager.primaryBlue
                              : ColorManager.softGray,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedFilters.add(filter);
                      } else {
                        selectedFilters.remove(filter);
                      }
                    });
                  },
                  selectedColor: ColorManager.shadowBlue,
                  backgroundColor: ColorManager.pureWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: ColorManager.borderGrey),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
