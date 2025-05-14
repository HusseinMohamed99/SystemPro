import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class BathroomsWidget extends StatefulWidget {
  const BathroomsWidget({super.key});

  @override
  State<BathroomsWidget> createState() => BathroomsWidgetState();
}

class BathroomsWidgetState extends State<BathroomsWidget> {
  final List<String> options = ['Any', '1', '2', '3', '4', '5+'];
  String? selectedOption;

  /// Getter to expose selected bathrooms as int
  int? get selectedBathrooms {
    if (selectedOption == null || selectedOption == 'Any') {
      return null;
    } else if (selectedOption == '5+') {
      return 5;
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
          context.localization.bathrooms,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        verticalSpacing(kSpacingSmall),
        Wrap(
          spacing: 8,
          children:
              options.map((e) {
                final isSelected = selectedOption == e;
                return ChoiceChip(
                  showCheckmark: false,
                  label: Text(
                    e,
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeightHelper.regular,
                      color:
                          isSelected
                              ? ColorManager.pureWhite
                              : AdaptiveColor.adaptiveColor(
                                context: context,
                                lightColor: ColorManager.softGray,
                                darkColor: ColorManager.pureWhite,
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
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedOption = isSelected ? null : e;
                    });
                  },
                );
              }).toList(),
        ),
      ],
    );
  }
}
