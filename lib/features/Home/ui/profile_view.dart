import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/responsive_size_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';

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
              fontWeight: FontWeightHelper.semiBold,
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

class CustomProfileInfo extends StatelessWidget {
  const CustomProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const String name = 'Hossam Elshabrawy';
    return Row(
      spacing: kSpacingDefault.w,
      children: [
        Container(
          width: 88.w,
          height: 88.h,
          decoration: BoxDecoration(
            color: ColorManager.shadowBlue,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: kSpacingDefault.h,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'hossamelshabrawy@example.com',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ColorManager.softGray,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CsutomProfileCard extends StatelessWidget {
  const CsutomProfileCard({
    super.key,
    required this.isLocalization,
    required this.title,
    required this.language,
    required this.isThemeMode,
    required this.themeMode,
    this.onTap,
  });

  final bool isLocalization, isThemeMode;
  final String title, language, themeMode;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        width: context.width,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(vertical: kSpacingXLarge.h),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            const Spacer(),
            if (isLocalization || isThemeMode)
              GestureDetector(
                onTap: onTap,
                child: Row(
                  spacing: kSpacingSmall.w,
                  children: [
                    Text(
                      isLocalization ? language : themeMode,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeightHelper.regular,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorManager.pureBlack,
                      size: 20.sp,
                    ),
                  ],
                ),
              )
            else
              Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.pureBlack,
                size: 20.sp,
              ),
          ],
        ),
      ),
    );
  }
}

class CsutomProfileCardList extends StatelessWidget {
  const CsutomProfileCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 7,
      separatorBuilder:
          (context, index) =>
              Divider(height: 1.h, color: ColorManager.borderGrey),
      itemBuilder:
          (context, index) => CsutomProfileCard(
            onTap: () {
              if (index == 1) {
                context.read<ChangeLocalizationCubit>().changeLocalization();
              }else if(index == 2){
                context.read<ChangeThemingCubit>().toggleTheme();
              }
            },
            isLocalization: index == 1,
            isThemeMode: index == 2,
            title: profileCardList(context)[index],
            language: context.localization.english,
            themeMode: context.localization.light_mode,
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
