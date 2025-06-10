import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Search/data/model/category_response.dart';

class AmenitiesWidget extends StatefulWidget {
  const AmenitiesWidget({super.key, required this.amenities});
  final List<Amenity> amenities;
  @override
  State<AmenitiesWidget> createState() => AmenitiesWidgetState();
}

class AmenitiesWidgetState extends State<AmenitiesWidget> {
  final Set<String> selectedAmenities = {};
  bool showAll = false;
  List<int> get selectedAmenityIds {
    return widget.amenities
        .where((amenity) => selectedAmenities.contains(amenity.name))
        .map((amenity) => amenity.id ?? 0)
        .where((id) => id != 0)
        .toList();
  }

  void clearSelection() {
    setState(selectedAmenities.clear);
  }

  @override
  Widget build(BuildContext context) {
    final allAmenities = widget.amenities;
    final displayedAmenities = showAll ? allAmenities : allAmenities.take(5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.localization.amenities,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        SizedBox(height: kSpacingSmall.h),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children:
              displayedAmenities.map((amenity) {
                final isSelected = selectedAmenities.contains(amenity.name);
                return FilterChip(
                  showCheckmark: false,
                  label: Text(
                    amenity.name ?? '',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color:
                          isSelected
                              ? customWhiteAndTertiaryBlackColor(context)
                              : customSoftAndIconGreyColor(context),
                    ),
                  ),
                  selectedColor: customPrimaryAndSecondaryBlueColor(context),
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
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedAmenities.add(amenity.name ?? '');
                      } else {
                        selectedAmenities.remove(amenity.name ?? '');
                      }
                    });
                  },
                );
              }).toList(),
        ),
        if (allAmenities.length > 5)
          GestureDetector(
            onTap: () {
              setState(() {
                showAll = !showAll;
              });
            },
            child: Padding(
              padding:  EdgeInsetsDirectional.only(top: 12.0.h),
              child: Text(
                showAll
                    ? context.localization.show_less
                    : context.localization.see_more_amenities,
                textAlign: TextAlign.center,
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.medium,
                  color: customPrimaryAndSecondaryBlueColor(context),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
