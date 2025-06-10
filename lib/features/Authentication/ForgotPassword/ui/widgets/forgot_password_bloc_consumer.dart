import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/logic/forgot_password_state.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/ui/widgets/forgot_password_view_body.dart';

/// This widget combines state listener and builder for Forgot Password screen.
class ForgotPasswordBlocConsumer extends StatelessWidget {
  const ForgotPasswordBlocConsumer({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          // 🎯 Show success feedback to user
          context.showSnackBar(context.localization.check_email);
          // 🎯 Navigate to OTP screen with email from state
          final email =
              context.read<ForgotPasswordCubit>().emailController.text.trim();
          context.pushReplacementNamed(
            Routes.forgotPasswordOtpView,
            arguments: ForgotPasswordRequestBody(email: email),
          );
        }
        if (state is ForgotPasswordError) {
          context.showSnackBar(state.error);
        }
      },
      builder: (context, state) {
        final isLoading = state is ForgotPasswordLoading;
        return LoadingIndicatorOverlay(
          isLoading: isLoading,
          child: const ForgotPasswordViewBody().allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
        );
      },
    );
  }
}
