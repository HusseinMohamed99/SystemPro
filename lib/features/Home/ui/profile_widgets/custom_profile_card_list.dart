import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/functions/url_launcher.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/dividers/adaptive_divider.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';
import 'package:system_pro/features/Home/ui/profile_widgets/custom_profile_card.dart';

class CustomProfileCardList extends StatelessWidget {
  const CustomProfileCardList({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLocalizationCubit, ChangeLocalizationState>(
      builder: (context, state) {
        final selectedLanguage =
            CachingHelper.getData(SharedPrefKeys.selectedLanguage) ?? 'en';
        final isDarkMode =
            CachingHelper.getData(SharedPrefKeys.isDarkMode) ?? false;

        final currentLanguage =
            selectedLanguage == 'ar'
                ? context.localization.arabic
                : context.localization.english;
        final currentThemeMode =
            isDarkMode
                ? context.localization.dark_mode
                : context.localization.light_mode;

        final profileCards = profileCardList(context);

        return SliverList.separated(
          itemCount: profileCards.length,
          separatorBuilder: (_, _) => const AdaptiveDivider(),
          itemBuilder: (context, index) {
            return CustomProfileCard(
              onTap: () => _handleCardTap(context, index),
              isLocalization: index == 1,
              isThemeMode: index == 2,
              title: profileCards[index],
              language: currentLanguage,
              themeMode: currentThemeMode,
            );
          },
        );
      },
    );
  }

  void _handleCardTap(BuildContext context, int index) async {
    final navigator = Navigator.of(context);
    final profileCubit = context.read<ProfileCubit>();

    switch (index) {
      case 0:
        final result = await navigator.pushNamed(
          Routes.editProfileView,
          arguments: userName,
        );

        if (!context.mounted) return;

        if (result == true) {
          profileCubit.emitGetProfileStates(context: context);
        }
        break;

      case 1:
        await _showLanguageSheet(context);
        break;

      case 2:
        await _showThemeSheet(context);
        break;

      case 3:
      case 4:
        await launchUrlWithPermission(
          context: context,
          url: 'https://real-estate-one-lake.vercel.app/#/about',
        );
        break;

      case 5:
        await launchUrlWithPermission(
          context: context,
          url: 'https://real-estate-one-lake.vercel.app/#/Terms',
        );
        break;

      case 6:
        await launchUrlWithPermission(
          context: context,
          url: 'https://real-estate-one-lake.vercel.app/#/privacy',
        );
        break;
    }
  }

  Future<void> _showLanguageSheet(BuildContext context) async {
    final selected =
        CachingHelper.getData(SharedPrefKeys.selectedLanguage) ?? 'en';
    await _showTwoOptionsSheet(
      context,
      title: context.localization.language,
      firstTitle: context.localization.english,
      secondTitle: context.localization.arabic,
      onFirstTap: () => _updateLanguage(context, 'en', selected),
      onSecondTap: () => _updateLanguage(context, 'ar', selected),
    );
  }

  Future<void> _showThemeSheet(BuildContext context) async {
    final isDark = CachingHelper.getData(SharedPrefKeys.isDarkMode) ?? false;
    await _showTwoOptionsSheet(
      context,
      title: context.localization.theme_mode,
      firstTitle: context.localization.light_mode,
      secondTitle: context.localization.dark_mode,
      onFirstTap: () => _updateTheme(context, false, isDark),
      onSecondTap: () => _updateTheme(context, true, isDark),
    );
  }

  Future<void> _updateLanguage(
    BuildContext context,
    String code,
    String current,
  ) async {
    if (code != current) {
      await context.read<ChangeLocalizationCubit>().changeLocalization(code);
    }
  }

  Future<void> _updateTheme(
    BuildContext context,
    bool newMode,
    bool currentMode,
  ) async {
    if (newMode != currentMode) {
      await CachingHelper.setData(SharedPrefKeys.isDarkMode, newMode);
      if (!context.mounted) return;

      context.read<ChangeThemingCubit>().toggleTheme();
    }
  }

  Future<void> _showTwoOptionsSheet(
    BuildContext context, {
    required String title,
    required String firstTitle,
    required String secondTitle,
    required VoidCallback onFirstTap,
    required VoidCallback onSecondTap,
  }) {
    final localization = context.localization;
    return showModalBottomSheet(
      backgroundColor: customWhiteAndTertiaryBlackColor(context),
      context: context,
      builder:
          (context) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: kSpacingDefault.h,
              horizontal: kSpacingDefault.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 4.h,
                  color: customSoftAndIconGreyColor(context),
                ),
                verticalSpacing(kSpacingDefault),
                Text(
                  '${localization.change} $title',
                  style: context.titleLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: customBlackAndHintGreyColor(context),
                  ),
                ),
                ListTile(
                  title: Text(firstTitle, style: context.titleLarge),
                  onTap: () {
                    context.pop();
                    onFirstTap();
                  },
                ),
                ListTile(
                  title: Text(secondTitle, style: context.titleLarge),
                  onTap: () {
                    context.pop();
                    onSecondTap();
                  },
                ),
              ],
            ),
          ),
    );
  }
}

List<String> profileCardList(BuildContext context) => [
  context.localization.edit_profile,
  context.localization.language,
  context.localization.theme_mode,
  context.localization.contact_us,
  context.localization.about_us,
  context.localization.terms_of_use,
  context.localization.privacy_policy,
];
