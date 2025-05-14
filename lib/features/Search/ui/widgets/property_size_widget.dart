import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/textFields/custom_text_form_field.dart';

class PropertySizeWidget extends StatelessWidget {
  const PropertySizeWidget({
    super.key,
    required this.minSizeController,
    required this.minSizeFocusNode,
    required this.maxSizeController,
    required this.maxSizeFocusNode,
  });
  final TextEditingController minSizeController;
  final FocusNode minSizeFocusNode;
  final TextEditingController maxSizeController;

  final FocusNode maxSizeFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: kSpacingSmall.h,
      children: [
        Text(
          context.localization.property_size,
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),

        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: context.localization.min,
                focusNode: minSizeFocusNode,
                controller: minSizeController,
              ),
            ),
            horizontalSpacing(kSpacingDefault),
            Expanded(
              child: CustomTextFormField(
                hintText: context.localization.max,
                focusNode: maxSizeFocusNode,
                controller: maxSizeController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
