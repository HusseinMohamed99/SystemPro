import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_bloc_consumer.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customSecondaryAppBar(context, title: ''),
    body: ChangePasswordBlocConsumer().allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
    
    );
  }
}

