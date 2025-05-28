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
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/custom_pinput_otp.dart';

class EmailVerifyViewBody extends StatefulWidget {
  const EmailVerifyViewBody({
    super.key,
    required this.email,
    required this.isLoading,
  });

  final String email;
  final bool isLoading;

  @override
  State<EmailVerifyViewBody> createState() => _EmailVerifyViewBodyState();
}

class _EmailVerifyViewBodyState extends State<EmailVerifyViewBody> {
  late EmailVerifyCubit cubit;
  Timer? _timer;
  int _start = 59;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<EmailVerifyCubit>();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    cubit.validationCodeController.dispose(); // Dispose to avoid memory leaks
    super.dispose();
  }

  // Timer logic for resend countdown
  void startTimer() {
    _canResend = false;
    _start = 59;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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

  // Getter to enable/disable the button
  bool get formIsValid => cubit.validationCodeController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Form(
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

          // Email + "We sent code"
          SliverToBoxAdapter(
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: context.localization.we_sent_code,
                      style: context.titleLarge?.copyWith(
                        color: ColorManager.softGray,
                      ),
                    ),
                    TextSpan(
                      text: '  ${widget.email}',
                      style: context.titleLarge?.copyWith(
                        color: ColorManager.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),

          // OTP Input Field
          SliverToBoxAdapter(
            child: CustomPinputOtpCodeWidget(
              validationCodeController: cubit.validationCodeController,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),

          // Verify Button
          SliverToBoxAdapter(
            child: CustomButton(
              text: context.localization.verify,
              isLoading: widget.isLoading,
              isDisabled: !formIsValid,
              onPressed: validateThenDoCheckOtp,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),

          // Resend Section with Timer
          SliverToBoxAdapter(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '${context.localization.send_code_again}  ',
                style: context.titleLarge?.copyWith(
                  color: _canResend
                      ? ColorManager.primaryBlue
                      : ColorManager.softGray,
                  fontWeight: FontWeightHelper.semiBold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (_canResend) validateThenDoResendOtp();
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
            ),
          ),
        ],
      ),
    );
  }

  // Handle OTP resend logic
  void validateThenDoResendOtp() {
    if (widget.email.isNotEmpty) {
      cubit.emitResendOtpStates(email: widget.email);
      startTimer(); // Restart the timer
    }
  }

  // Handle OTP verification logic
  void validateThenDoCheckOtp() {
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitEmailVerifyStates(email: widget.email);
    }
  }
}
