import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Authentication/SignUp/ui/widgets/signup_view_bloc_consumer.dart';

/// Signup screen entry point
class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(), // Custom shared AppBar
      body: const SignupViewBlocConsumer(), // UI handled via BlocConsumer
    );
  }
}
