import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';

class CustomIconImage extends StatelessWidget {
  const CustomIconImage({
    super.key,
    required this.image,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.semanticLabel,
  });

  final String image;
  final Color? color;
  final BoxFit fit;
  final Alignment alignment;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    // Determines the appropriate icon color
    // based on current theme if not overridden.
    final iconColor = color ?? customSoftGreyAndWhiteColor(context);

    return SizedBox(
      width: kSizeSecondaryWidth.w,
      height: kSizeSecondaryHeight.h,
      child: Center(
        child: SvgPicture.asset(
          image,
          fit: fit,
          alignment: alignment,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          semanticsLabel: semanticLabel,
          placeholderBuilder: (context) => const CustomLoader(),
        ),
      ),
    );
  }
}
