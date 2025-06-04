import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/functions/filters.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

/// A responsive filter row using ChoiceChips.
/// Items are evenly distributed based on [maxItemsPerRow].
/// Supports adaptive theming, full-width layout, and item spacing.
class PropertyFiltersRow extends StatelessWidget {
  const PropertyFiltersRow({
    super.key,

    /// List of available filter options (enum-based)
    required this.filtersToggle,

    /// Currently selected filter value (string)
    required this.selectedFilter,

    /// Callback to notify parent when a filter is selected
    required this.onToggleChanged,

    /// Max number of items per row (defaults to 3)
    this.maxItemsPerRow = 3,

    /// Horizontal spacing between items (defaults to 10.0)
    this.itemSpacing = 10.0,
  });

  final List<FilterToggle> filtersToggle;
  final String selectedFilter;
  final void Function(String selectedValue) onToggleChanged;
  final int maxItemsPerRow;
  final double itemSpacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine how many items to show per row
        final int effectiveCount =
            filtersToggle.length < maxItemsPerRow
                ? filtersToggle.length
                : maxItemsPerRow;

        // Calculate total spacing between items
        final double totalSpacing = itemSpacing * (effectiveCount - 1);

        // Compute the width of each chip
        final double itemWidth =
            (constraints.maxWidth - totalSpacing) / effectiveCount;

        return Wrap(
          spacing: itemSpacing,
          runSpacing: 10.h,
          children:
              filtersToggle.map((toggle) {
                // Get label text and value from enum
                final label = filterToggleLabel(context, toggle);
                final value = filterToggleValue(toggle);
                final isSelected = selectedFilter == value;

                // Define theme-aware colors
                final selectedTextColor = customPrimaryBlueAndWhiteColor(
                  context,
                );

                final unselectedTextColor = customHintAndSoftGreyColor(context);

                final selectedBackgroundColor = customPrimaryAndShadowBlueColor(
                  context,
                );

                final unselectedBackgroundColor =
                    customWhiteAndTertiaryBlackColor(context);

                final borderColor = customShowBlueAndTertiaryBlackColor(
                  context,
                );
                return SizedBox(
                  width: itemWidth,
                  child: ChoiceChip(
                    /// Padding inside the label
                    labelPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),

                    /// Full-width label with centered text
                    label: SizedBox(
                      width: double.infinity,
                      child: Text(
                        label,
                        textAlign: TextAlign.center,
                        style: context.titleLarge?.copyWith(
                          color:
                              isSelected
                                  ? selectedTextColor
                                  : unselectedTextColor,
                          fontWeight: FontWeightHelper.medium,
                        ),
                      ),
                    ),

                    /// Selection logic
                    selected: isSelected,
                    onSelected: (_) {
                      if (!isSelected) onToggleChanged(value);
                    },

                    /// Theming and styling
                    selectedColor: selectedBackgroundColor,
                    backgroundColor: unselectedBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadiusMedium),
                      side: BorderSide(color: borderColor),
                    ),
                    showCheckmark: false,
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
