import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

class ResendCodeText extends StatelessWidget {
  const ResendCodeText({
    super.key,
    required this.canResend,
    required this.secondsLeft,
    required this.onResendTap,
  });

  final bool canResend;
  final int secondsLeft;
  final VoidCallback onResendTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: context.localization.send_code_again,
        style: context.titleLarge?.copyWith(
          color: canResend ? ColorManager.primaryBlue : ColorManager.softGray,
          fontWeight: FontWeightHelper.semiBold,
        ),
        recognizer:
            TapGestureRecognizer()..onTap = canResend ? onResendTap : null,
        children: [
          TextSpan(
            text: '  00:${secondsLeft.toString().padLeft(2, '0')}',
            style: context.titleLarge?.copyWith(color: ColorManager.softGray),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
