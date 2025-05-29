import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class EmailTextHighlight extends StatelessWidget {
  const EmailTextHighlight({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: context.localization.we_sent_code,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: ColorManager.softGray),
          ),
          TextSpan(
            text: '  $email',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: ColorManager.primaryBlue),
          ),
        ],
      ),
    );
  }
}
