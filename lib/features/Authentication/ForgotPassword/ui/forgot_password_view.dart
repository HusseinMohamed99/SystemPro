import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Authentication/ForgotPassword/ui/widgets/forgot_password_view_body.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(appBar: basicAppBar(), body: const ForgotPasswordViewBody());
  }
}