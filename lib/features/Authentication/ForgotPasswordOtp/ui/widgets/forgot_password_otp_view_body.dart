import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_cubit.dart';
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
  int _start = 20;
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
      key: context.read<OtpCubit>().formKey,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Text(
              context.localization.check_email,
              style: Theme.of(context).textTheme.headlineLarge,
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
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ColorManager.softGray,
                      ),
                    ),
                    if (widget.email.isNotEmpty)
                      TextSpan(
                        text: '  ${widget.email}',

                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: ColorManager.primaryBlue,
                        ),
                      )
                    else
                      TextSpan(
                        text: '  ${widget.email}',

                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                  context.read<OtpCubit>().validationCodeController,
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
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
      context.read<OtpCubit>().emitResendOtpStates(
        ResendOtpRequestBody(email: widget.email),
      );
    }
  }

  void validateThenDoCheckOtp(BuildContext context) {
    if (context.read<OtpCubit>().formKey.currentState!.validate()) {
      context.read<OtpCubit>().emitCheckOtpStates(
        CheckOtpRequestBody(
          email: widget.email,
          otp: context.read<OtpCubit>().validationCodeController.text,
        ),
      );
    }
  }
}
