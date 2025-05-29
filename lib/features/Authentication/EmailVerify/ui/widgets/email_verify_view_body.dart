import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/custom_pinput_otp.dart';

class EmailVerifyViewBody extends StatefulWidget {
  const EmailVerifyViewBody({super.key, required this.email});
  final String email;

  @override
  State<EmailVerifyViewBody> createState() => _EmailVerifyViewBodyState();
}

class _EmailVerifyViewBodyState extends State<EmailVerifyViewBody>
    with TickerProviderStateMixin {
  late EmailVerifyCubit cubit;
  Timer? _timer;
  int _start = 59;
  bool _canResend = false;
  bool _hasError = false;
  bool _isCompleted = false;

  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;
  late AnimationController _fadeInController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    cubit = context.read<EmailVerifyCubit>();
    startTimer();

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
  void dispose() {
    _timer?.cancel();
    cubit.validationCodeController.dispose();
    _shakeController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  void startTimer() {
    _canResend = false;
    _start = 59;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_start == 0) {
        setState(() {
          _canResend = true;
          timer.cancel();
        });
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailVerifyCubit, EmailVerifyState>(
      listenWhen:
          (prev, curr) =>
              curr is EmailVerifyError || curr is EmailVerifySuccess,
      listener: (context, state) {
        if (state is EmailVerifyError) {
          setState(() => _hasError = true);
          _shakeController.forward(from: 0);
        } else if (state is EmailVerifySuccess) {
          setState(() => _hasError = false);
        }
      },
      child: Form(
        key: cubit.formKey,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                context.localization.check_email,
                style: context.headlineLarge,
              ),
            ),
            SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
            SliverToBoxAdapter(child: _buildEmailText(context)),
            SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _shakeController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_shakeAnimation.value, 0),
                    child: FadeTransition(
                      opacity: _fadeInAnimation,
                      child: CustomPinputOtpCodeWidget(
                        validationCodeController:
                            cubit.validationCodeController,
                        hasError: _hasError,
                       onCompleted: (code) {
                          if (code.length == 4) {
                            setState(() => _isCompleted = true);
                          }
                        },
                        onChanged: (code) {
                          if (code.length < 4) {
                            setState(() => _isCompleted = false);
                          }
                        },

                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
            SliverToBoxAdapter(
              child: CustomButton(
                text: context.localization.verify,
                isLoading:
                    context.watch<EmailVerifyCubit>().state
                        is EmailVerifyLoading,
                isDisabled: !_isCompleted,
                onPressed: _handleOtpVerification,
              ),
            ),
            SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
            SliverToBoxAdapter(child: _buildResendLink(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailText(BuildContext context) => RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: context.localization.we_sent_code,
          style: context.titleLarge?.copyWith(color: ColorManager.softGray),
        ),
        TextSpan(
          text: '  ${widget.email}',
          style: context.titleLarge?.copyWith(color: ColorManager.primaryBlue),
        ),
      ],
    ),
  );

  Widget _buildResendLink(BuildContext context) => Text.rich(
    textAlign: TextAlign.center,
    TextSpan(
      text: '${context.localization.send_code_again}  ',
      style: context.titleLarge?.copyWith(
        color: _canResend ? ColorManager.primaryBlue : ColorManager.softGray,
        fontWeight: FontWeightHelper.semiBold,
      ),
      recognizer:
          TapGestureRecognizer()
            ..onTap = () {
              if (_canResend) _handleResendOtp();
            },
      children: [
        TextSpan(
          text: '00:${_start.toString().padLeft(2, '0')}',
          style: context.titleLarge?.copyWith(
            color: ColorManager.softGray,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
      ],
    ),
  );

  void _handleOtpVerification() {
    if (cubit.formKey.currentState!.validate()) {
      cubit.verifyEmail(email: widget.email);
    }
  }

  void _handleResendOtp() {
    cubit.resendOtp(email: widget.email);
    startTimer();
  }
}
