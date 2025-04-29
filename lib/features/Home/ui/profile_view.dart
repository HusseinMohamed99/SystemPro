import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/features/Home/ui/widgets/custom_profile_card_list.dart';
import 'package:system_pro/features/Home/ui/widgets/custom_profile_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            context.localization.profile,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: ColorManager.primaryBlue,
            ),
          ),
        ),
        verticalSpacing(kSpacingXLarge),
        const CustomProfileInfo(),
        verticalSpacing(kSpacingDefault),
        Expanded(
          child: CustomScrollView(
            slivers: [
              const CsutomProfileCardList(),
              SliverToBoxAdapter(
                child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      context.localization.logout,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeightHelper.medium,
                        color: ColorManager.primaryBlue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
