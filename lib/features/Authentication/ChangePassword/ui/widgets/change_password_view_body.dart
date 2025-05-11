import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_form.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            context.localization.reset_password,
            style: context.headlineLarge,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
        SliverToBoxAdapter(
          child: Text(
            context.localization.reset_password_subtitle,
            style: context.titleLarge?.copyWith(color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.softGray,
                darkColor: ColorManager.hintGrey,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
        SliverFillRemaining(
          hasScrollBody: false,
          child: ChangePasswordForm(email: email),
        ),
      ],
    );
  }
}
