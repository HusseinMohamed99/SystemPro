import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/constants/keys.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
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
    return SliverList.separated(
      itemCount: profileCardList(context).length,
      separatorBuilder: (context, index) => const CustomDivider(),
      itemBuilder: (context, index) {
        final String selectedLanguage =
            CachingHelper.getData(SharedPrefKeys.selectedLanguage) ??
            context.localization.english;
        final String currentLanguage =
            selectedLanguage == context.localization.arabic
                ? context.localization.arabic
                : context.localization.english;
        final bool isDarkMode =
            CachingHelper.getData(SharedPrefKeys.isDarkMode) ?? false;
        final String currentThemeMode =
            isDarkMode
                ? context.localization.dark_mode
                : context.localization.light_mode;
        return CsutomProfileCard(
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
              await customBottomSheet(
                context: context,
                title: context.localization.language,
                firstTitle: context.localization.english,
                secondTitle: context.localization.arabic,
                firstOnTap: () async {
                  if (selectedLanguage != context.localization.english) {
                    await CachingHelper.setData(
                      SharedPrefKeys.selectedLanguage,
                      context.localization.english,
                    );
                    context.read<ChangeLocalizationCubit>().toggleLocale();
                  }
                },
                secondOnTap: () async {
                  if (selectedLanguage != context.localization.arabic) {
                    await CachingHelper.setData(
                      SharedPrefKeys.selectedLanguage,
                      context.localization.arabic,
                    );
                    context.read<ChangeLocalizationCubit>().toggleLocale();
                  }
                },
              );
            } else if (index == 2) {
              await customBottomSheet(
                context: context,
                title: context.localization.theme_mode,
                firstTitle: context.localization.light_mode,
                secondTitle: context.localization.dark_mode,
                firstOnTap: () async {
                  if (isDarkMode) {
                    context.read<ChangeThemingCubit>().toggleTheme();
                    await CachingHelper.setData(
                      SharedPrefKeys.isDarkMode,
                      false,
                    );
                  }
                },
                secondOnTap: () async {
                  if (!isDarkMode) {
                    context.read<ChangeThemingCubit>().toggleTheme();
                    await CachingHelper.setData(
                      SharedPrefKeys.isDarkMode,
                      true,
                    );
                  }
                },
              );
            }
          },
          isLocalization: index == 1,
          isThemeMode: index == 2,
          title: profileCardList(context)[index],
          language: currentLanguage,
          themeMode: currentThemeMode,
        );
      },
    );
  }

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
