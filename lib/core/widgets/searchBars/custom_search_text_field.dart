import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
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
  });
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final void Function(String)? onSubmitted;
  final bool? isSearcView;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        if (readOnly == true) {
          // context.pushNamed(Routes.searchView);
        }
      },
      controller: controller,
      readOnly: readOnly ?? true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorManager.softWhite,
        hintText: context.localization.search,
        hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: ColorManager.softGray,
          fontWeight: FontWeightHelper.regular,
        ),
        prefixIcon: CustomIconImage(image: Assets.images.search),
        contentPadding: EdgeInsets.symmetric(
          horizontal: kPaddingDefaultHorizontal.w,
        ),
        border: buildOutlineBorder(),
        enabledBorder: buildOutlineBorder(),
        focusedBorder: buildOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(kBorderRadiusMedium).r,
      borderSide: BorderSide(width: 1.5.w, color: ColorManager.borderGrey),
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
      child: Center(child: SvgPicture.asset(image)),
    );
  }
}
