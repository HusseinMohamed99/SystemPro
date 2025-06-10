import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
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
  int? selectedTypeId;
  bool showAll = false;
  void clearSelection() {
    setState(() => selectedTypeId = null);
  }

  @override
  Widget build(BuildContext context) {
    final typesToShow =
        showAll ? widget.subcategories : widget.subcategories?.take(5).toList();
    if (widget.subcategories == null || widget.subcategories!.isEmpty) {
      return CustomErrorTextWidget(
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
                final isSelected = selectedTypeId == subcategory.id;
                return FilterChip(
                  showCheckmark: false,
                  label: Text(
                    subcategory.name ?? 'غير معروف',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color:
                          isSelected
                              ? ColorManager.pureWhite
                              : customSoftAndHintGreyColor(context),
                    ),
                  ),
                  selectedColor: ColorManager.primaryBlue,
                  backgroundColor: customWhiteAndTertiaryBlackColor(context),
                  side:
                      isSelected
                          ? BorderSide.none
                          : BorderSide(
                            color: customBorderGreyAndTertiaryBlackColor(
                              context,
                            ),
                          ),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      final id = subcategory.id;
                      if (id == null) return;
                      // ✅ Toggle selection logic
                      if (selectedTypeId == id) {
                        selectedTypeId = null;
                      } else {
                        selectedTypeId = id;
                      }
                    });
                  },
                );
              }).toList(),
        ),
        if ((widget.subcategories?.length ?? 0) > 5)
          GestureDetector(
            onTap: () => setState(() => showAll = !showAll),
            child: Text(
              showAll
                  ? context.localization.show_less
                  : '${context.localization.see_more} ${widget.titleType ?? context.localization.property_type}',
              textAlign: TextAlign.center,
              style: context.titleMedium?.copyWith(
                fontWeight: FontWeightHelper.medium,
                color: customPrimaryAndSecondaryBlueColor(context),
              ),
            ),
          ),
      ],
    );
  }
}
