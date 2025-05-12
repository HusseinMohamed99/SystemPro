import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/searchBars/custom_search_text_field.dart';

class SearchBarWithFilterButton extends StatelessWidget {
  const SearchBarWithFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomSearchTextField()),
        horizontalSpacing(8),
        Container(
          decoration: BoxDecoration(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.primaryBlue,
              darkColor: ColorManager.secondaryBlue,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsetsDirectional.all(10),
          child: const Icon(Icons.tune, color: ColorManager.pureWhite),
        ),
      ],
    );
  }
}
