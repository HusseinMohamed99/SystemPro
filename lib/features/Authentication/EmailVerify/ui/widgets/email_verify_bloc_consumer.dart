import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/email_verify_view_body.dart';

/// Handles state changes and UI rendering for email verification.
class EmailVerifyBlocConsumer extends StatelessWidget {
  const EmailVerifyBlocConsumer({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
      listenWhen:
          (prev, curr) =>
              curr is EmailVerifySuccess ||
              curr is EmailVerifyError ||
              curr is ResendOtpSuccess,
      listener: _handleState,
      builder: (context, state) {
        final isLoading = state is EmailVerifyLoading;

        return LoadingIndicatorOverlay(
          isLoading: isLoading,
          child: EmailVerifyViewBody(email: email).allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
        );
      },
    );
  }

  /// Extracted listener logic to improve readability and separation.
  void _handleState(BuildContext context, EmailVerifyState state) {
    if (state is ResendOtpSuccess) {
      context.showSnackBar(context.localization.send_code);
    } else if (state is EmailVerifySuccess) {
      context.showSnackBar(context.localization.account_created_successfully);
      context.pushReplacementNamed(Routes.loginView);
    } else if (state is EmailVerifyError) {
      context.showSnackBar(state.error);
    }
  }
}
