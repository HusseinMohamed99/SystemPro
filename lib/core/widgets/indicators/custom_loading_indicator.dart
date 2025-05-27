import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: AdaptiveColor.adaptiveColor(
              context: context,
              lightColor:ColorManager.safeHex('#80000000'),
              darkColor: ColorManager.safeHex('#80FFFFFF'),
            ),
            child: const Center(
              child: SpinKitWaveSpinner(
                duration: Duration(seconds: 5),
                color: ColorManager.primaryBlue,
                waveColor: ColorManager.primaryBlue,
                trackColor: ColorManager.primaryBlue,
              ),
            ),
          ),
      ],
    );
  }
}

class AdaptiveIndicator extends StatelessWidget {
  const AdaptiveIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeInOut(
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.primaryBlue,
          darkColor: ColorManager.secondaryBlue,
        ),
      ),
    );
  }
}
