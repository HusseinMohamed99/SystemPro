import 'package:flutter/material.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/custom_pinput_otp.dart';

/// Animated OTP input widget that shakes on error and fades in on load.
class OtpAnimatedInput extends StatefulWidget {
  const OtpAnimatedInput({
    super.key,
    required this.controller,
    required this.hasError,
    required this.onCompleted,
    required this.onChanged,
  });

  final TextEditingController controller;
  final bool hasError;
  final ValueChanged<String> onCompleted;
  final ValueChanged<String> onChanged;

  @override
  State<OtpAnimatedInput> createState() => _OtpAnimatedInputState();
}

class _OtpAnimatedInputState extends State<OtpAnimatedInput>
    with TickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize shake animation controller
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: 0), weight: 1),
    ]).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.easeOut),
    );

    // Initialize fade-in animation
    _fadeInController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeInAnimation = CurvedAnimation(
      parent: _fadeInController,
      curve: Curves.easeIn,
    );
    _fadeInController.forward();
  }

  @override
  void didUpdateWidget(covariant OtpAnimatedInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Trigger shake animation when error is updated
    if (widget.hasError && !oldWidget.hasError) {
      _shakeController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _shakeController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakeAnimation.value, 0),
          child: FadeTransition(
            opacity: _fadeInAnimation,
            child: CustomPinputOtpCodeWidget(
              validationCodeController: widget.controller,
              hasError: widget.hasError,
              onCompleted: widget.onCompleted,
              onChanged: widget.onChanged,
            ),
          ),
        );
      },
    );
  }
}
