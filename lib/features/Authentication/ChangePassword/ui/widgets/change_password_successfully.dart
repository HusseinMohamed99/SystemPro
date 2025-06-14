import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/gen/assets.gen.dart';

class ChangePasswordSuccessfully extends StatelessWidget {
  const ChangePasswordSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    
    final textColor = customBlackAndWhiteColor(context);

    final subtitleColor = customSoftAndHintGreyColor(context);

    return Scaffold(
      appBar: basicAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success Icon
            SvgPicture.asset(Assets.images.star),

            verticalSpacing(kSpacingXXLarge),

            // Success Title
            Text(
              context.localization.password_changed,
              style: context.headlineLarge?.copyWith(
                color: textColor,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),

            verticalSpacing(kSpacingDefault),

            // Success Subtitle
            Text(
              context.localization.password_changed_subtitle,
              textAlign: TextAlign.center,
              style: context.titleLarge?.copyWith(
                color: subtitleColor,
                fontWeight: FontWeightHelper.regular,
              ),
            ),

            verticalSpacing(kSpacingXXLarge),

            // Back to Login Button
            CustomButton(
              text: context.localization.back_to_login,
              onPressed: () {
                // Clears the navigation stack and navigates to login screen
                context.pushReplacementNamed(Routes.loginView);
              },
            ),
          ],
        ).allPadding(
          vPadding: kPaddingDefaultVertical,
          hPadding: kPaddingDefaultHorizontal,
        ),
      ),
    );
  }
}
