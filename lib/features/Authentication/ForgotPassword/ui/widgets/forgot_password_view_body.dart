import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/textFields/email_form_field_widget.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/ui/widgets/forgot_password_form.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            context.localization.forgot_password,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
        SliverToBoxAdapter(
          child: Text(
            context.localization.forgot_password_subtitle,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: ColorManager.softGray),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
        const SliverFillRemaining(
          hasScrollBody: false,
          child:  ForgotPasswordForm(),
        ),
      ],
    );
  }
}

