import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

/// A widget that displays the location of a real estate source
/// (either a company or marketer) with localization and adaptive theming.
/// Includes an icon, label, and the address string.
class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key, required this.location});

  /// The location string to be displayed.
  final String location;
  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${context.localization.location}: $location',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location title (e.g., "Location")
          Text(
            context.localization.location,
            style: context.titleLarge?.copyWith(
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          verticalSpacing(kSpacingSmall),
          // Row containing icon and location text
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location icon with tooltip
              Tooltip(
                message: context.localization.location,
                child: Icon(
                  Icons.place_outlined,
                  color: customPureBlackAndIconGreyColor(context),
                  size: kIconSizeDefault.sp,
                ),
              ),
              horizontalSpacing(kSpacingSmall),
              // Location text with overflow handling
              Flexible(
                child: Text(
                  location.isEmpty
                      ? context.localization.no_data_found
                      : location,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.regular,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
