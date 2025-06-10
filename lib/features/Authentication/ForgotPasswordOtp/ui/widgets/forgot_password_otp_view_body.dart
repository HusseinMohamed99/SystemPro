import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/functions/custom_color.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/animations/otp_animated_input.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/check_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/data/model/resend_otp_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_state.dart';

class ForgotPasswordOtpViewBody extends StatelessWidget {
  const ForgotPasswordOtpViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    final otpCubit = context.read<OtpCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      otpCubit.startTimerIfNeeded();
    });
    return BlocBuilder<OtpCubit, OtpState>(
      buildWhen:
          (prev, curr) =>
              curr is OtpError ||
              curr is OtpResendAvailable ||
              curr is TimerTicking ||
              curr is OtpLoading,
      builder: (context, state) {
        final secondsLeft = state is TimerTicking ? state.secondsRemaining : 0;
        final canResend = state is OtpResendAvailable;
        final hasError = state is OtpError;
        final isLoading = state is OtpLoading;
        final isCompleted = otpCubit.isCompleted;
        return Form(
          key: otpCubit.formKey,
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
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: context.localization.we_sent_code,
                        style: context.titleLarge?.copyWith(
                          color: customSoftAndHintGreyColor(context),
                        ),
                      ),
                      TextSpan(
                        text: '  $email',
                        style: context.titleLarge?.copyWith(
                          color: customPrimaryAndSecondaryBlueColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              // OTP Input
              SliverToBoxAdapter(
                child: OtpAnimatedInput(
                  controller: otpCubit.validationCodeController,
                  hasError: hasError,
                  onChanged:
                      (code) => otpCubit.markOtpCompletion(code.length == 4),
                  onCompleted:
                      (code) => otpCubit.markOtpCompletion(code.length == 4),
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
              // Verify Button
              SliverToBoxAdapter(
                child: CustomButton(
                  text: context.localization.verify,
                  isLoading: isLoading,
                  isDisabled: !isCompleted,
                  onPressed: () {
                    if (otpCubit.formKey.currentState?.validate() ?? false) {
                      otpCubit.checkOtp(
                        CheckOtpRequestBody(
                          email: email,
                          otp: otpCubit.validationCodeController.text.trim(),
                        ),
                      );
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
              // Resend Section
              SliverToBoxAdapter(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: '${context.localization.send_code_again}  ',
                    style: context.titleLarge?.copyWith(
                      color:
                          canResend
                              ? customPrimaryAndSecondaryBlueColor(context)
                              : customSoftAndHintGreyColor(context),
                      fontWeight: FontWeightHelper.semiBold,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            if (canResend) {
                              otpCubit.resendOtp(
                                ResendOtpRequestBody(
                                  email: email,
                                  type: 'register',
                                ),
                              );
                            }
                          },
                    children: [
                      TextSpan(
                        text: '00:${secondsLeft.toString().padLeft(2, '0')}',
                        style: context.titleLarge?.copyWith(
                          color: customSoftAndHintGreyColor(context),
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
      },
    );
  }
}
