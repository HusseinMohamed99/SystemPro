import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_bloc_consumer.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSecondaryAppBar(context),
      body: ChangePasswordBlocConsumer(email: email),
    );
  }
}
