import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/ui/widgets/forgot_password_bloc_consumer.dart';

/// Forgot Password screen that displays the email input and manages state.

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSecondaryAppBar(context),
      body: const ForgotPasswordBlocConsumer(),
    );
  }
}
