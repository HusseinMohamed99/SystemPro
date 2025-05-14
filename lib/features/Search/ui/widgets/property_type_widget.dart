import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/errors/custom_error_widget.dart';
import 'package:system_pro/features/Search/data/model/category_response.dart';

class PropertyTypeWidget extends StatefulWidget {
  const PropertyTypeWidget({super.key, this.titleType, this.subcategories});

  final String? titleType;
  final List<Subcategory>? subcategories;

  @override
  State<PropertyTypeWidget> createState() => PropertyTypeWidgetState();
}

class PropertyTypeWidgetState extends State<PropertyTypeWidget> {
  final Set<String> selectedTypes =
      {}; // This is where selected types are stored
  bool showAll = false;

  void clearSelection() {
    setState(() {
      selectedTypes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Display only the first 5 items unless `showAll` is true
    final typesToShow =
        showAll ? widget.subcategories : widget.subcategories?.take(5).toList();

    // If there are no subcategories, show an error
    if (widget.subcategories == null || widget.subcategories!.isEmpty) {
      return CustomErrorWidget(
        errorMessage: context.localization.no_data_found,
      );
    }

    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.titleType ?? context.localization.property_type,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Wrap(
          spacing: 5.w,
          children:
              typesToShow!.map((subcategory) {
                final isSelected = selectedTypes.contains(subcategory.name);
                return FilterChip(
                  showCheckmark: false,
                  label: Text(
                    subcategory.name ?? 'غير معروف',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color:
                          isSelected
                              ? ColorManager.pureWhite
                              : AdaptiveColor.adaptiveColor(
                                context: context,
                                lightColor: ColorManager.softGray,
                                darkColor: ColorManager.hintGrey,
                              ),
                    ),
                  ),
                  selectedColor: ColorManager.primaryBlue,
                  backgroundColor: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.pureWhite,
                    darkColor: ColorManager.tertiaryBlack,
                  ),
                  side:
                      isSelected
                          ? BorderSide.none
                          : BorderSide(
                            color: AdaptiveColor.adaptiveColor(
                              context: context,
                              lightColor: ColorManager.borderGrey,
                              darkColor: ColorManager.tertiaryBlack,
                            ),
                          ),
                  selected: selectedTypes.contains(subcategory.name),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedTypes.add(subcategory.name ?? '');
                      } else {
                        selectedTypes.remove(subcategory.name ?? '');
                      }
                    });
                  },
                );
              }).toList(),
        ),
        if ((widget.subcategories?.length ?? 0) > 5)
          GestureDetector(
            onTap: () {
              setState(() {
                showAll = !showAll;
              });
            },
            child: Text(
              showAll
                  ? context.localization.show_less
                  : '${context.localization.see_more} ${widget.titleType ?? context.localization.property_type}',
              textAlign: TextAlign.center,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
                color: AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.primaryBlue,
                  darkColor: ColorManager.secondaryBlue,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
