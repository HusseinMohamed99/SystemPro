import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/gen/assets.gen.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.readOnly = true,
    this.onTap,
    this.controller,
    this.onSubmitted,
    this.isSearcView = true,
    this.widget,
    this.onChanged,
  });
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final bool? isSearcView;
  final Widget? widget;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        if (readOnly == true) {
          context.pushNamed(Routes.searchView);
        }
      },
      style: context.titleMedium?.copyWith(
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.primaryBlack,
          darkColor: ColorManager.softWhite,
        ),
        fontWeight: FontWeightHelper.regular,
      ),
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly ?? true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.softWhite,
          darkColor: ColorManager.tertiaryBlack,
        ),
        
        hintText: context.localization.search,
        hintStyle: context.titleMedium?.copyWith(
          color: AdaptiveColor.adaptiveColor(
            context: context,
            lightColor: ColorManager.softGray,
            darkColor: ColorManager.hintGrey,
          ),
          fontWeight: FontWeightHelper.regular,
        ),
        prefixIcon: CustomIconImage(image: Assets.images.search),
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPaddingDefaultHorizontal.w,
        ),
        border: buildOutlineBorder(context),
        enabledBorder: buildOutlineBorder(context),
        focusedBorder: buildOutlineBorder(context),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusMedium).r,
      borderSide: BorderSide(
        width: 1.5.w,
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.borderGrey,
          darkColor: ColorManager.tertiaryBlack,
        ),
      ),
    );
  }
}

class CustomIconImage extends StatelessWidget {
  const CustomIconImage({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kSizeSecondaryWidth.w,
      height: kSizeSecondaryHeight.h,
      child: Center(
        child: SvgPicture.asset(
          image,
          colorFilter: ColorFilter.mode(
            AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.softGray,
              darkColor: ColorManager.softWhite,
            ),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
