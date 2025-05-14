import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/localization/localization_state.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/networking/cache/caching_helper.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/dividers/custom_divider.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';
import 'package:system_pro/features/Home/ui/profile_widgets/custom_profile_card.dart';

class CustomProfileCardList extends StatelessWidget {
  const CustomProfileCardList({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    // تخزين البيانات الخاصة باللغة ووضع الظلام في متغيرات ثابتة لتجنب الفحص المتكرر
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
          separatorBuilder: (context, index) => const CustomDivider(),
          itemBuilder: (context, index) {
            return CustomProfileCard(
              onTap: () async {
                if (index == 0) {
                  final result = await context.pushNamed(
                    Routes.editProfileView,
                    arguments: userName,
                  );
                  if (result == true) {
                    context.read<ProfileCubit>().emitGetProfileStates();
                  }
                } else if (index == 1) {
                  await _showLanguageSelectionSheet(context, selectedLanguage);
                } else if (index == 2) {
                  await _showThemeSelectionSheet(context, isDarkMode);
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

  // دالة لعرض اختيار اللغة
  Future<void> _showLanguageSelectionSheet(
    BuildContext context,
    String selectedLanguageCode, // ← تأكد أنه كود اللغة 'en' أو 'ar'
  ) async {
    final localizationCubit = context.read<ChangeLocalizationCubit>();

    await customBottomSheet(
      context: context,
      title: context.localization.language,
      firstTitle: context.localization.english,
      secondTitle: context.localization.arabic,
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


  // دالة لعرض اختيار السمة (الوضع المظلم/الفاتح)
  Future<void> _showThemeSelectionSheet(
    BuildContext context,
    bool isDarkMode,
  ) async {
    await customBottomSheet(
      context: context,
      title: context.localization.theme_mode,
      firstTitle: context.localization.light_mode,
      secondTitle: context.localization.dark_mode,
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

  // دالة لتحديث السمة
  Future<void> _updateTheme(BuildContext context, bool isDarkMode) async {
    await CachingHelper.setData(SharedPrefKeys.isDarkMode, isDarkMode);
    context.read<ChangeThemingCubit>().toggleTheme();
  }

  // دالة لإظهار Bottom Sheet
  Future<dynamic> customBottomSheet({
    required BuildContext context,
    required String title,
    required String firstTitle,
    required String secondTitle,
    required VoidCallback firstOnTap,
    required VoidCallback secondOnTap,
  }) {
    return showModalBottomSheet(
      backgroundColor: AdaptiveColor.adaptiveColor(
        context: context,
        lightColor: ColorManager.pureWhite,
        darkColor: ColorManager.tertiaryBlack,
      ),
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
                    color: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.softGray,
                      darkColor: ColorManager.iconGrey,
                    ),
                  ),
                ),
                verticalSpacing(kSpacingDefault),
                Text(
                  '${context.localization.change} $title',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                    color: AdaptiveColor.adaptiveColor(
                      context: context,
                      lightColor: ColorManager.pureBlack,
                      darkColor: ColorManager.hintGrey,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    firstTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.pureBlack,
                        darkColor: ColorManager.hintGrey,
                      ),
                    ),
                  ),
                  onTap: () {
                    firstOnTap();
                    context.pop();
                  },
                ),
                ListTile(
                  title: Text(
                    secondTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.pureBlack,
                        darkColor: ColorManager.hintGrey,
                      ),
                    ),
                  ),
                  onTap: () {
                    secondOnTap();
                    context.pop();
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
