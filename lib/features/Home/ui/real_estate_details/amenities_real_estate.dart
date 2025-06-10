import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/data/model/realestate/amenities.dart';

class AmenitiesWidget extends StatelessWidget {
  const AmenitiesWidget({super.key, required this.amenities});
  final List<Amenities> amenities;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.amenities,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        Wrap(
          spacing: kSpacingXLarge.w,
          runSpacing: kSpacingSmall.h,
          children:
              amenities.map((amenity) {
                return SizedBox(
                  width: context.width * 0.40,
                  child: Text(
                    amenity.name ?? '',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
