import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class AmenitiesWidget extends StatefulWidget {
  const AmenitiesWidget({super.key});

  @override
  State<AmenitiesWidget> createState() => AmenitiesWidgetState();
}

class AmenitiesWidgetState extends State<AmenitiesWidget> {
  final List<String> allAmenities = [
    'Central A/C',
    'Balcony',
    'Maids room',
    'Pets allowed',
    'Private pool',
    'Gym',
    'Elevator',
    'Parking',
  ];
  final Set<String> selectedAmenities = {};
  bool showAll = false;
  void clearSelection() {
    setState(selectedAmenities.clear);
  }

  @override
  Widget build(BuildContext context) {
    final amenitiesToShow =
        showAll ? allAmenities : allAmenities.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: kSpacingSmall.h,
      children: [
        Text(
          context.localization.amenities,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),

        Wrap(
          spacing: 8,
          children:
              amenitiesToShow.map((amenity) {
                final isSelected = selectedAmenities.contains(amenity);
                return FilterChip(
                  showCheckmark: false,
                  label: Text(
                    amenity,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
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
                  selected: selectedAmenities.contains(amenity),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        selectedAmenities.add(amenity);
                      } else {
                        selectedAmenities.remove(amenity);
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
            child: Text(
              showAll
                  ? context.localization.show_less
                  : context.localization.see_more_amenities,
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
