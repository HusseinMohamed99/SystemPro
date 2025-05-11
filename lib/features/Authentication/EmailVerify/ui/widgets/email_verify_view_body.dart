import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/custom_pinput_otp.dart';

class EmailVerifyViewBody extends StatefulWidget {
  const EmailVerifyViewBody({super.key, required this.email});
  final String email;

  @override
  State<EmailVerifyViewBody> createState() => _EmailVerifyViewBodyState();
}

class _EmailVerifyViewBodyState extends State<EmailVerifyViewBody> {
  Timer? _timer;
  int _start = 59;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _canResend = false;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 00) {
        setState(() {
          _canResend = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<EmailVerifyCubit>().formKey,
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
                    if (widget.email.isNotEmpty)
                      TextSpan(
                        text: '  ${widget.email}',
                        style: context.titleLarge?.copyWith(
                          color: ColorManager.primaryBlue,
                        ),
                      )
                    else
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
          // PinPut
          SliverToBoxAdapter(
            child: CustomPinputOtpCodeWidget(
              validationCodeController:
                  context.read<EmailVerifyCubit>().validationCodeController,
            ),
          ),
          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
          SliverToBoxAdapter(
            child: CustomButton(
              text: context.localization.verify,
              onPressed: () {
                 validateThenDoCheckOtp(context);
              },
            ),
          ),
          SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
          SliverToBoxAdapter(
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: '${context.localization.send_code_again}  ',
                style: context.titleLarge?.copyWith(
                  color:
                      _canResend
                          ? ColorManager.primaryBlue
                          : ColorManager.softGray,
                  fontWeight: FontWeightHelper.semiBold,
                ),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        if (_canResend) {
                          validateThenDoResendOtp(context);
                        }
                      },
                children: [
                  TextSpan(
                    text: '00:${_start.toString()}',
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

  void validateThenDoResendOtp(BuildContext context) {
    if (widget.email.isNotEmpty) {
      context.read<EmailVerifyCubit>().emitResendOtpStates(email: widget.email);
    }
  }

  void validateThenDoCheckOtp(BuildContext context) {
    if (context.read<EmailVerifyCubit>().formKey.currentState!.validate()) {
      context.read<EmailVerifyCubit>().emitEmailVerifyStates(
        email: widget.email,
      );
    }
  }
}
