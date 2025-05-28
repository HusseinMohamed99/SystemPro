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
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/custom_pinput_otp.dart';

class ForgotPasswordOtpViewBody extends StatefulWidget {
  const ForgotPasswordOtpViewBody({super.key, required this.email});

  final String email;

  @override
  State<ForgotPasswordOtpViewBody> createState() =>
      _ForgotPasswordOtpViewBodyState();
}

class _ForgotPasswordOtpViewBodyState extends State<ForgotPasswordOtpViewBody> {
  Timer? _timer;
  int _start = 59;
  bool _canResend = false;
  late TapGestureRecognizer _resendRecognizer;

  @override
  void initState() {
    super.initState();
    _resendRecognizer = TapGestureRecognizer();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _resendRecognizer.dispose(); // Prevent memory leak
    super.dispose();
  }

  void startTimer() {
    _canResend = false;
    _start = 59;
    _timer?.cancel(); // Cancel previous timer
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

  bool get isFormValid {
    final otpController = context.read<OtpCubit>().validationCodeController;
    return otpController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OtpCubit>();
    final otpController = cubit.validationCodeController;

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

          // Email & Message
          SliverToBoxAdapter(
            child: FittedBox(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: context.localization.we_sent_code,
                      style: context.titleLarge?.copyWith(
                        color: AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.softGray,
                          darkColor: ColorManager.hintGrey,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '  ${widget.email}',
                      style: context.titleLarge?.copyWith(
                        color: AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.primaryBlue,
                          darkColor: ColorManager.secondaryBlue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),

          // OTP Input
          SliverToBoxAdapter(
            child: CustomPinputOtpCodeWidget(
              validationCodeController: otpController,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),

          // Verify Button
          SliverToBoxAdapter(
            child: CustomButton(
              text: context.localization.verify,
              isLoading: cubit.state is OtpLoading,
              isDisabled: !isFormValid,
              onPressed: validateThenDoCheckOtp,
            ),
          ),

          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),

          // Resend OTP
          SliverToBoxAdapter(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '${context.localization.send_code_again}  ',
                style: context.titleLarge?.copyWith(
                  color: _canResend
                      ? AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.primaryBlue,
                          darkColor: ColorManager.secondaryBlue,
                        )
                      : AdaptiveColor.adaptiveColor(
                          context: context,
                          lightColor: ColorManager.softGray,
                          darkColor: ColorManager.hintGrey,
                        ),
                  fontWeight: FontWeightHelper.semiBold,
                ),
                recognizer: _resendRecognizer
                  ..onTap = () {
                    if (_canResend) {
                      validateThenDoResendOtp();
                      startTimer(); // Restart countdown
                    }
                  },
                children: [
                  TextSpan(
                    text: '00:${_start.toString().padLeft(2, '0')}',
                    style: context.titleLarge?.copyWith(
                      color: AdaptiveColor.adaptiveColor(
                        context: context,
                        lightColor: ColorManager.softGray,
                        darkColor: ColorManager.hintGrey,
                      ),
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

  void validateThenDoResendOtp() {
    if (widget.email.isNotEmpty) {
      context.read<OtpCubit>().emitResendOtpStates(
        ResendOtpRequestBody(email: widget.email, type: 'register'),
      );
    }
  }

  void validateThenDoCheckOtp() {
    final cubit = context.read<OtpCubit>();
    if (cubit.formKey.currentState!.validate()) {
      cubit.emitCheckOtpStates(
        CheckOtpRequestBody(
          email: widget.email,
          otp: cubit.validationCodeController.text,
        ),
      );
    }
  }
}
