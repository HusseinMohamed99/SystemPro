import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class PurposeWidget extends StatelessWidget {
  const PurposeWidget({super.key, required this.purpose});
  final String purpose;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: kSpacingDefault.h,
      children: [
        Text(
          context.localization.purpose,
          style: context.titleLarge?.copyWith(
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        if (purpose == 'buy')
          Text(
            '${context.localization.for_to} ${context.localization.sale}',
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeightHelper.regular,
            ),
          )
        else
          Text(
            '${context.localization.for_to} $purpose',
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeightHelper.regular,
            ),
          ),
      ],
    );
  }
}
