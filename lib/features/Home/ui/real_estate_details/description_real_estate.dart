import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.description,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        verticalSpacing(kSpacingSmall),

        StatefulBuilder(
          builder: (context, setState) {
            final TextEditingController textController = TextEditingController(
              text: description,
            );
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textController.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                if (textController.text.length >= 150)
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              backgroundColor: customWhiteAndTertiaryBlackColor(context),
                              content: SingleChildScrollView(
                                child: Text(
                                  textController.text,
                                  style: context.titleMedium?.copyWith(
                                    fontWeight: FontWeightHelper.regular,
                                  ),
                                ),
                              ),
                            ),
                      );
                    },
                    child: Text(
                      context.localization.see_more,
                      style: context.titleMedium?.copyWith(
                        fontWeight: FontWeightHelper.regular,
                        color: customPrimaryAndSecondaryBlueColor(context),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
