import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:system_pro/core/helpers/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';


/// A unified and customizable loading indicator widget for all types.
class CustomLoader extends StatelessWidget {
  const CustomLoader({
    super.key,
    this.type = LoaderType.circular,
    this.color,
    this.size,
  });

  /// Type of loader (circular, adaptive, wave).
  final LoaderType type;

  /// Color of the loader.
  final Color? color;

  /// Optional size for loaders that support it.
  final double? size;

  @override
  Widget build(BuildContext context) {
    final loaderColor =
        color ??
        customPrimaryAndSecondaryBlueColor(context);

    switch (type) {
      case LoaderType.adaptive:
        return Center(
          child: SpinKitThreeInOut(color: loaderColor, size: size ?? 40.sp),
        );

      case LoaderType.wave:
        return Center(
          child: SpinKitWaveSpinner(
            color: loaderColor,
            waveColor: loaderColor,
            trackColor: loaderColor,
            duration: const Duration(seconds: 2),
            size: size ?? 45.sp,
          ),
        );

      case LoaderType.circular:
      return SizedBox(
          width: size ?? 20.w,
          height: size ?? 20.w,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(loaderColor),
          ),
        );
    }
  }
}

/// Overlay-based loader wrapper for screens or widgets.
class LoadingIndicatorOverlay extends StatelessWidget {
  const LoadingIndicatorOverlay({
    super.key,
    required this.isLoading,
    required this.child,
    this.loaderType = LoaderType.wave,
    this.overlayColor,
  });

  final bool isLoading;
  final Widget child;
  final LoaderType loaderType;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color:
                overlayColor ??
                AdaptiveColor.adaptiveColor(
                  context: context,
                  lightColor: ColorManager.safeHex('#80000000'),
                  darkColor: ColorManager.safeHex('#80FFFFFF'),
                ),
            child: Center(child: CustomLoader(type: loaderType)),
          ),
      ],
    );
  }
}
