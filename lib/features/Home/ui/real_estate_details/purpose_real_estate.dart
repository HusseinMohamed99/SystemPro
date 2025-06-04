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

        Text(
          '${context.localization.for_to} ${_localizedPurpose(context, purpose)}',
          style: context.titleMedium?.copyWith(
            fontWeight: FontWeightHelper.regular,
          ),
        ),
      ],
    );
  }

  String _localizedPurpose(BuildContext context, String purpose) {
    switch (purpose) {
      case 'buy':
        return context.localization.sale;
      case 'rent':
        return context.localization.rent;
      case 'booking':
        return context.localization.book;
      default:
        return purpose; // fallback in case of unexpected value
    }
  }
}
