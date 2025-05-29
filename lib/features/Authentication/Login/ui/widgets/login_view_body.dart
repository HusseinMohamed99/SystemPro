import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/custom_image_logo.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/login_form.dart';

/// Login screen body containing logo, heading, and login form.
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
    physics: const BouncingScrollPhysics(), // Enable iOS-style bounce effect
      slivers: [
        const SliverToBoxAdapter(child: CustomImageLogo()),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
        SliverToBoxAdapter(
          child: Text(context.localization.login, style: context.headlineLarge),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
        const SliverFillRemaining(hasScrollBody: false, child: LoginForm()),
      ],
    );
  }
}
