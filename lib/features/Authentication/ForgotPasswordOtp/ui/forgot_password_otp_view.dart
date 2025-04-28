import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/forgot_password_otp_bloc_consumer.dart';

class ForgotPasswordOtpView extends StatelessWidget {
  const ForgotPasswordOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSecondaryAppBar(context, title: ''),
      body: const ForgotPasswordOtpBlocConsumer(email: 'email',),
    );
  }
}
