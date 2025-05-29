import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/ui/widgets/forgot_password_form.dart';

/// Forgot Password screen content (title, subtitle, form)
class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: _buildHeader(context)),
           SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: ForgotPasswordForm(),
        ),
      ],
    );
  }

  /// Header section with title and subtitle
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.forgot_password,
          style: context.headlineLarge,
        ),
        verticalSpacing(kSpacingDefault),
        Text(
          context.localization.forgot_password_subtitle,
          style: context.titleLarge?.copyWith(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGray,
              darkColor: ColorManager.hintGrey,
            ),
          ),
        ),
      ],
    );
  }
}
