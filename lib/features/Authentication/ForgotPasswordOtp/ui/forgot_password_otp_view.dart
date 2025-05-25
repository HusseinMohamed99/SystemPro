import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/data/model/forgot_password_request_body.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/forgot_password_otp_bloc_consumer.dart';

class ForgotPasswordOtpView extends StatelessWidget {
  const ForgotPasswordOtpView({super.key, required this.arguments});
  final ForgotPasswordRequestBody arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: customSecondaryAppBar(context),
      body:  ForgotPasswordOtpBlocConsumer(email: arguments.email),
    );
  }
}
