import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/textFields/custom_text_form_field.dart';

class PriceRangeWidget extends StatelessWidget {
  const PriceRangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: kSpacingSmall.h,
      children: [
        Text(
          context.localization.price_range,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),

        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintText: context.localization.min,
                focusNode: FocusNode(),
                controller: TextEditingController(),
              ),
            ),
            horizontalSpacing(kSpacingDefault),
            Expanded(
              child: CustomTextFormField(
                hintText: context.localization.max,
                focusNode: FocusNode(),
                controller: TextEditingController(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
