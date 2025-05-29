import 'package:flutter/material.dart';
import 'package:system_pro/core/widgets/appBars/basic_app_bar.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/login_view_bloc_consumer.dart';

/// The main login screen with an AppBar and BLoC consumer body.
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: basicAppBar(), body: const LoginViewBlocConsumer());
  }
}
