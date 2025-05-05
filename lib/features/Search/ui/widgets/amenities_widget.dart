import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/data/model/amenities.dart';

class AmenitiesWidget extends StatefulWidget {
  const AmenitiesWidget({super.key, required this.amenities});
final List<Amenities>amenities;
  @override
  State<AmenitiesWidget> createState() => AmenitiesWidgetState();
}

class AmenitiesWidgetState extends State<AmenitiesWidget> {
  
  final Set<String> selectedAmenities = {};
  bool showAll = false;
  void clearSelection() {
    setState(selectedAmenities.clear);
  }

  @override
  Widget build(BuildContext context) {
    final allAmenities = widget.amenities;

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
              allAmenities.map((amenity) {
                final isSelected = selectedAmenities.contains(amenity.name);
                return FilterChip(
                  showCheckmark: false,
                  label: Text(
                    amenity.name??'',
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
                  selected: selectedAmenities.contains(amenity.name),
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
