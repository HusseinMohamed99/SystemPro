import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/email_verify_bloc_consumer.dart';

/// A screen where the user can enter the OTP to verify their email.
class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({super.key, required this.email});

  /// The email address to verify, passed from the signup screen.
  final String email;

  @override
  Widget build(BuildContext context) {
    // Defensive check in case email is passed null or empty.
    assert(email.isNotEmpty, 'Email must not be empty');

    return Scaffold(
      appBar: customSecondaryAppBar(context,onBackPress: () => context.pushReplacementNamed(Routes.loginView)),
      body: EmailVerifyBlocConsumer(email: email),
    );
  }
}
