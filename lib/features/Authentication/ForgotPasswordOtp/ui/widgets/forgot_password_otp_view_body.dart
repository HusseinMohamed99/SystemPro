import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';

class ForgotPasswordOtpViewBody extends StatelessWidget {
  const ForgotPasswordOtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            context.localization.check_email,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
        SliverToBoxAdapter(
          child: FittedBox(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: context.localization.we_sent_code,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ColorManager.softGray,
                    ),
                  ),
                  TextSpan(
                    text: ' hussein@systempro.com',

                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ColorManager.primaryBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),

        // PinPut
        // const SliverFillRemaining(
        //   hasScrollBody: false,
        //   child: ForgotPasswordForm(),
        // ),
        SliverToBoxAdapter(
          child: CustomButton(
            text: context.localization.verify,
            onPressed: () {},
          ),
        ), 
        //  SliverToBoxAdapter(
        //   child: ,
        // ),
      ],
    );
  }
}
