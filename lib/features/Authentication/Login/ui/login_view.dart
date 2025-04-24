import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const SafeArea(child: LoginViewBody()).allPadding(
          vPadding: kPaddingLargeVertical,
          hPadding: kPaddingDefaultHorizontal,
        ),
      ),
    );
  }
}
