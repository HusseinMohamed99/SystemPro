import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
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
        final String selectedLanguage =
            CachingHelper.getData(SharedPrefKeys.selectedLanguage) ?? 'en';
        final bool isDarkMode =
            CachingHelper.getData(SharedPrefKeys.isDarkMode) ?? false;
        final String currentLanguage =
            selectedLanguage == 'ar'
                ? context.localization.arabic
                : context.localization.english;
        final String currentThemeMode =
            isDarkMode
                ? context.localization.dark_mode
                : context.localization.light_mode;
        final profileCards = profileCardList(context);
        return SliverList.separated(
          itemCount: profileCards.length,
          separatorBuilder: (context, index) => const AdaptiveDivider(),
          itemBuilder: (context, index) {
            return CustomProfileCard(
              onTap: () async {
                final navigator = Navigator.of(context);
                final profileCubit = context.read<ProfileCubit>();
                if (index == 0) {
                  final result = await navigator.pushNamed(
                    Routes.editProfileView,
                    arguments: userName,
                  );
                  if (result == true) {
                    profileCubit.emitGetProfileStates();
                  }
                } else if (index == 1) {
                  await _showLanguageSelectionSheet(
                    navigator.context,
                    selectedLanguage,
                  );
                } else if (index == 2) {
                  await _showThemeSelectionSheet(navigator.context, isDarkMode);
                }
              },
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

  Future<void> _showLanguageSelectionSheet(
    BuildContext context,
    String selectedLanguageCode,
  ) async {
    final localization = context.localization;
    await customBottomSheet(
      context: context,
      title: localization.language,
      firstTitle: localization.english,
      secondTitle: localization.arabic,
      firstOnTap: () async {
        if (selectedLanguageCode != 'en') {
          await _updateLanguage(context, 'en');
        }
      },
      secondOnTap: () async {
        if (selectedLanguageCode != 'ar') {
          await _updateLanguage(context, 'ar');
        }
      },
    );
  }

  Future<void> _updateLanguage(
    BuildContext context,
    String languageCode,
  ) async {
    await context.read<ChangeLocalizationCubit>().changeLocalization(
      languageCode,
    );
  }

  Future<void> _showThemeSelectionSheet(
    BuildContext context,
    bool isDarkMode,
  ) async {
    final localization = context.localization;
    await customBottomSheet(
      context: context,
      title: localization.theme_mode,
      firstTitle: localization.light_mode,
      secondTitle: localization.dark_mode,
      firstOnTap: () async {
        if (isDarkMode) {
          await _updateTheme(context, false);
        }
      },
      secondOnTap: () async {
        if (!isDarkMode) {
          await _updateTheme(context, true);
        }
      },
    );
  }

  Future<void> _updateTheme(BuildContext context, bool isDarkMode) async {
    final cubit = context.read<ChangeThemingCubit>();
    if (cubit.isClosed) return;

    await CachingHelper.setData(SharedPrefKeys.isDarkMode, isDarkMode);
    cubit.toggleTheme();
  }

  Future<dynamic> customBottomSheet({
    required BuildContext context,
    required String title,
    required String firstTitle,
    required String secondTitle,
    required VoidCallback firstOnTap,
    required VoidCallback secondOnTap,
  }) {
    final localization = context.localization;
    return showModalBottomSheet(
      backgroundColor: customWhiteAndTertiaryBlackColor(context),
      context: context,
      builder:
          (context) => Container(
            padding: EdgeInsetsDirectional.symmetric(
              vertical: kSpacingDefault.h,
              horizontal: kSpacingDefault.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    color: customSoftAndIconGreyColor(context),
                  ),
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
                  title: Text(
                    firstTitle,
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: customBlackAndHintGreyColor(context),
                    ),
                  ),
                  onTap: () {
                    context.pop();
                    firstOnTap();
                  },
                ),
                ListTile(
                  title: Text(
                    secondTitle,
                    style: context.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: customBlackAndHintGreyColor(context),
                    ),
                  ),
                  onTap: () {
                   context.pop();
                    secondOnTap();
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
