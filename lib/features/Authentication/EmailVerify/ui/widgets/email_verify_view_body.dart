import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/widgets/animations/otp_animated_input.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/email_text_highlight.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/resend_code_text.dart';

class EmailVerifyViewBody extends StatelessWidget {
  const EmailVerifyViewBody({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmailVerifyCubit>();

    // ✅ Start timer after the first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cubit.secondsLeft == 59) {
        cubit.startTimer();
      }
    });
    return BlocBuilder<EmailVerifyCubit, EmailVerifyState>(
      buildWhen:
          (prev, curr) =>
              curr is EmailVerifyError ||
              curr is InputCompletionChanged ||
              curr is TimerTicking ||
              curr is EmailVerifyLoading,
      builder: (context, state) {
        final isLoading = state is EmailVerifyLoading;
        final hasError = state is EmailVerifyError;
       final isCompleted = cubit.isCompleted;

  final secondsLeft = context.select((EmailVerifyCubit cubit) {
          final state = cubit.state;
          if (state is TimerTicking) return state.secondsLeft;
          if (state is TimerExpired) return 0;
          return 59;
        });


        final canResend = secondsLeft == 0;

        return Form(
          key: cubit.formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  context.localization.check_email,
                  style: context.headlineLarge,
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingDefault)),
              SliverToBoxAdapter(child: EmailTextHighlight(email: email)),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXLarge)),
              SliverToBoxAdapter(
                child: OtpAnimatedInput(
                  controller: cubit.validationCodeController,
                  hasError: hasError,
                  onCompleted: (code) {
                    if (code.length == 4) {
                      cubit.markOtpCompletion(true);
                    }
                  },
                  onChanged: (code) {
                    if (code.length < 4) {
                      cubit.markOtpCompletion(false);
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
              SliverToBoxAdapter(
                child: CustomButton(
                  text: context.localization.verify,
                  isLoading: isLoading,
                  isDisabled: !isCompleted,
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.verifyEmail(email: email);
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(kSpacingXXXLarge)),
              SliverToBoxAdapter(
                child: ResendCodeText(
                  canResend: canResend,
                  secondsLeft: secondsLeft,
                  onResendTap: () => cubit.resendOtp(email: email),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
