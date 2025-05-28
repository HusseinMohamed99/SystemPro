import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/custom_image_logo.dart';
import 'package:system_pro/features/Authentication/SignUp/ui/widgets/signup_form.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: CustomImageLogo()),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
        SliverToBoxAdapter(
          child: Text(
            context.localization.sign_up,
            style: context.headlineLarge,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
         SliverFillRemaining(hasScrollBody: false, child: SignupForm()),
      ],
    );
  }
}
