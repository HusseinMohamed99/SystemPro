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
import 'package:system_pro/features/Home/logic/profile_cubit.dart';
import 'package:system_pro/features/Home/ui/profile_widgets/custom_profile_card.dart';

class CustomProfileCardList extends StatelessWidget {
  const CustomProfileCardList({super.key, required this.userName});
  final String userName;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: profileCardList(context).length,
      separatorBuilder:
          (context, index) =>
              Divider(height: 1.h, color: ColorManager.borderGrey),
      itemBuilder: (context, index) {
        // قراءة اللغة المختارة من SharedPreferences
        final String selectedLanguage =
            CachingHelper.getData(SharedPrefKeys.selectedLanguage) ?? 'en';
        final String currentLanguage =
            selectedLanguage == 'ar'
                ? context.localization.arabic
                : context.localization.english;

        // قراءة وضع الظلام من SharedPreferences
        final bool isDarkMode =
            CachingHelper.getData(SharedPrefKeys.isDarkMode) ?? false;

        // تحديد الوضع بناءً على القيمة المختارة
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
                  if (selectedLanguage != 'en') {
                    // إذا اللغة المختارة ليست "en"
                    await CachingHelper.setData(
                      SharedPrefKeys.selectedLanguage,
                      'en',
                    );
                    context.read<ChangeLocalizationCubit>().toggleLocale();
                  }
                },
                secondOnTap: () async {
                  if (selectedLanguage != 'ar') {
                    // إذا اللغة المختارة ليست "ar"
                    await CachingHelper.setData(
                      SharedPrefKeys.selectedLanguage,
                      'ar',
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
                    // إذا كان الوضع الحالي هو "داكن" و يريد تغييره إلى "فاتح"
                    await CachingHelper.setData(
                      SharedPrefKeys.isDarkMode,
                      false,
                    );
                    context.read<ChangeThemingCubit>().toggleTheme();
                  }
                },
                secondOnTap: () async {
                  if (!isDarkMode) {
                    // إذا كان الوضع الحالي هو "فاتح" و يريد تغييره إلى "داكن"
                    await CachingHelper.setData(
                      SharedPrefKeys.isDarkMode,
                      true,
                    );
                    context.read<ChangeThemingCubit>().toggleTheme();
                  }
                },
              );
            }
          },
          isLocalization: index == 1,
          isThemeMode: index == 2,
          title: profileCardList(context)[index],
          language: currentLanguage, // عرض اللغة الحالية هنا
          themeMode: currentThemeMode, // عرض الوضع الحالي هنا
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
      context: context,
      builder:
          (context) => Container(
            padding: EdgeInsets.symmetric(
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
                    color: ColorManager.borderGrey,
                  ),
                ),
                verticalSpacing(kSpacingDefault),
                Text(
                  '${context.localization.change} $title',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeightHelper.medium,
                  ),
                ),
                ListTile(
                  title: Text(
                    firstTitle,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeightHelper.medium,
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
