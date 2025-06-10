import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class BedroomsWidget extends StatefulWidget {
  const BedroomsWidget({super.key});

  @override
  State<BedroomsWidget> createState() => BedroomsWidgetState();
}

class BedroomsWidgetState extends State<BedroomsWidget> {
  final List<String> options = ['Any', '1', '2', '3', '4', '5', '6', '7', '8+'];
  String? selectedOption;

  /// Getter to expose selected bedrooms as int
  int? get selectedBedrooms {
    if (selectedOption == null || selectedOption == 'Any') {
      return null;
    } else if (selectedOption == '8+') {
      return 8;
    } else {
      return int.tryParse(selectedOption!);
    }
  }

  void clearSelection() {
    setState(() {
      selectedOption = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          context.localization.bedrooms,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        verticalSpacing(kSpacingSmall),
        Wrap(
          spacing: 8,
          children:
              options.map((item) {
                final isSelected = selectedOption == item;
                return ChoiceChip(
                  showCheckmark: false,
                  label: Text(
                    item,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color:
                          isSelected
                              ? ColorManager.pureWhite
                              : customSoftGreyAndWhiteColor(context),
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
                      selectedOption = isSelected ? null : item;
                    });
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}
