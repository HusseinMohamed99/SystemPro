import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/validations/validation_manager.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';

class CustomPinputOtpCodeWidget extends StatefulWidget {
  const CustomPinputOtpCodeWidget({
    super.key,
    required this.validationCodeController,
    required this.hasError,
  });

  final TextEditingController validationCodeController;
  final bool hasError;

  @override
  State<CustomPinputOtpCodeWidget> createState() =>
      _CustomPinputOtpCodeWidgetState();
}

class _CustomPinputOtpCodeWidgetState extends State<CustomPinputOtpCodeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _shakeAnimation;
  late final Animation<double> _fadeInAnimation;

  static const double _shakeOffset = 10;
  static const double _pinSize = 77.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -_shakeOffset), weight: 1),
      TweenSequenceItem(
        tween: Tween(begin: -_shakeOffset, end: _shakeOffset),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: _shakeOffset, end: -_shakeOffset),
        weight: 2,
      ),
      TweenSequenceItem(
        tween: Tween(begin: -_shakeOffset, end: _shakeOffset),
        weight: 2,
      ),
      TweenSequenceItem(tween: Tween(begin: _shakeOffset, end: 0), weight: 1),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 1.0, curve: Curves.easeIn),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CustomPinputOtpCodeWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasError && !oldWidget.hasError) {
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value, 0),
          child: FadeTransition(opacity: _fadeInAnimation, child: child),
        );
      },
      child: Pinput(
        controller: widget.validationCodeController,
        validator: (value) => ValidationManager.otpValidator(context, value),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        cursor: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 3,
            width: 30,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: AdaptiveColor.adaptiveColor(
                context: context,
                lightColor: ColorManager.pureBlack,
                darkColor: ColorManager.tertiaryBlack,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        defaultPinTheme: _pinTheme(context),
        focusedPinTheme: _pinTheme(context, isFocused: true),
        errorPinTheme: _pinTheme(context, isError: true),
      ),
    );
  }

  PinTheme _pinTheme(
    BuildContext context, {
    bool isError = false,
    bool isFocused = false,
  }) {
    final borderColor =
        isError
            ? ColorManager.errorRed
            : isFocused
            ? ColorManager.primaryBlue
            : AdaptiveColor.adaptiveColor(
              context: context,
              lightColor: ColorManager.borderGrey,
              darkColor: ColorManager.tertiaryBlack,
            );

    return PinTheme(
      width: _pinSize.w,
      height: _pinSize.h,
      textStyle: context.headlineLarge,
      decoration: BoxDecoration(
        color: AdaptiveColor.adaptiveColor(
          context: context,
          lightColor: ColorManager.pureWhite,
          darkColor: ColorManager.tertiaryBlack,
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: isFocused ? 1.5 : 1),
      ),
    );
  }
}
