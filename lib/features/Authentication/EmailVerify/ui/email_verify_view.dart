import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/email_verify_bloc_consumer.dart';

class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSecondaryAppBar(context, title: ''),
      body: EmailVerifyBlocConsumer(email: email),
    );
  }
}
