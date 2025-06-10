import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_form.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({
    super.key,
    required this.email,
    required this.isLoading,
  });

  final String email;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // Header title
        SliverToBoxAdapter(
          child: Text(
            context.localization.reset_password,
            style: context.headlineLarge,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
        // Subtitle
        SliverToBoxAdapter(
          child: Text(
            context.localization.reset_password_subtitle,
            style: context.titleLarge?.copyWith(
              color: customSoftAndHintGreyColor(context),
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
        // Form
        SliverFillRemaining(
          hasScrollBody: false,
          child: ChangePasswordForm(email: email, isLoading: isLoading),
        ),
      ],
    );
  }
}
