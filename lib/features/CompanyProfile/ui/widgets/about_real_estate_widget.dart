import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

/// A widget to display a short description with a "see more / read less" toggle.
class AboutRealEstateWidget extends StatefulWidget {
  const AboutRealEstateWidget({super.key, required this.description});
  final String description;

  @override
  State<AboutRealEstateWidget> createState() => _AboutRealEstateWidgetState();
}

class _AboutRealEstateWidgetState extends State<AboutRealEstateWidget> {
  /// Whether the full text is shown or not
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isLongText = widget.description.length >= 150;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title: "About"
        Text(
          context.localization.about,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        verticalSpacing(kSpacingSmall),

        // Display full or truncated text based on _isExpanded
        Text(
          widget.description,
          maxLines: _isExpanded ? null : 3,
          overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
        ),

        // Toggle button only shown if text is long
        if (isLongText)
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: EdgeInsetsDirectional.only(top: 6.0.h),
              child: Text(
                _isExpanded
                    ? context.localization.read_less
                    : context.localization.see_more,
                style: context.titleMedium?.copyWith(
                  fontWeight: FontWeightHelper.regular,
                  color: AdaptiveColor.adaptiveColor(
                    context: context,
                    lightColor: ColorManager.primaryBlue,
                    darkColor: ColorManager.secondaryBlue,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
