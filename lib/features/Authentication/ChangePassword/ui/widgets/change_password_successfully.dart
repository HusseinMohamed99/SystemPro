import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/gen/assets.gen.dart';

class ChangePasswordSuccessfully extends StatelessWidget {
  const ChangePasswordSuccessfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(),
      body: Center(
        child: Column(
          
        
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.images.star),
            verticalSpacing(kSpacingXXLarge),
            Text(
              context.localization.password_changed,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: ColorManager.pureBlack,
                fontWeight: FontWeightHelper.semiBold,
              ),
            ),
            verticalSpacing(kSpacingDefault),
            Text(
              context.localization.password_changed_subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: ColorManager.softGray,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
              verticalSpacing(kSpacingXXLarge),
            CustomButton(
              text: context.localization.back_to_login,
              onPressed: () {},
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
