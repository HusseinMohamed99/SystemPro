import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/animations/otp_animated_input.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/email_text_highlight.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/resend_code_text.dart';

/// Main body of the Email Verification screen.
class EmailVerifyViewBody extends StatelessWidget {
  const EmailVerifyViewBody({
    super.key,
    required this.email,
    this.vPadding = kPaddingLargeVertical,
    this.hPadding = kPaddingDefaultHorizontal,
  });

  final String email;
  final double vPadding;
  final double hPadding;

  @override
  Widget build(BuildContext context) {
    final emailVerifyCubit = context.read<EmailVerifyCubit>();

    // Start the timer only once after screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailVerifyCubit.startTimerIfNeeded();
    });

    return BlocBuilder<EmailVerifyCubit, EmailVerifyState>(
      buildWhen:
          (prev, curr) =>
              curr is EmailVerifyError ||
              curr is InputCompletionChanged ||
              curr is TimerTicking ||
              curr is EmailVerifyLoading,
      builder: (context, state) {
        return Form(
          key: emailVerifyCubit.formKey,
          child: CustomScrollView(
            slivers: [
              _buildHeader(context),
              _buildOtpField(context, emailVerifyCubit, state),
              _buildSubmitButton(context, emailVerifyCubit, state),
              _buildResendSection(context, emailVerifyCubit),
            ],
          ),
        ).allPadding(vPadding: vPadding, hPadding: hPadding);
      },
    );
  }

  /// Header text and email info
  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.localization.check_email, style: context.headlineLarge),
          verticalSpacing(kSpacingDefault),
          EmailTextHighlight(email: email),
          verticalSpacing(kSpacingXXLarge),
        ],
      ),
    );
  }

  /// Animated OTP input
  Widget _buildOtpField(
    BuildContext context,
    EmailVerifyCubit cubit,
    EmailVerifyState state,
  ) {
    final hasError = state is EmailVerifyError;

    return SliverToBoxAdapter(
      child: OtpAnimatedInput(
        controller: cubit.validationCodeController,
        hasError: hasError,
        onCompleted: (code) => cubit.markOtpCompletion(code.length == 4),
        onChanged: (code) => cubit.markOtpCompletion(code.length == 4),
      ),
    );
  }

  /// Submit (Verify) button
  Widget _buildSubmitButton(
    BuildContext context,
    EmailVerifyCubit cubit,
    EmailVerifyState state,
  ) {
    final isLoading = state is EmailVerifyLoading;
    final isCompleted = cubit.isCompleted;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: kSpacingXXXLarge.h),
        child: CustomButton(
          text: context.localization.verify,
          isLoading: isLoading,
          isDisabled: !isCompleted,
          onPressed: () {
            if (cubit.formKey.currentState?.validate() ?? false) {
              cubit.verifyEmail(email: email, context: context);
            }
          },
        ),
      ),
    );
  }

  /// Resend code timer and action
  Widget _buildResendSection(BuildContext context, EmailVerifyCubit cubit) {
    final secondsLeft = context.select((EmailVerifyCubit c) {
      final state = c.state;
      if (state is TimerTicking) return state.secondsLeft;
      if (state is TimerExpired) return 0;
      return 59;
    });

    final canResend = secondsLeft == 0;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: kSpacingXXXLarge.h),
        child: ResendCodeText(
          canResend: canResend,
          secondsLeft: secondsLeft,
          onResendTap: () => cubit.resendOtp(email: email, context: context),
        ),
      ),
    );
  }
}
