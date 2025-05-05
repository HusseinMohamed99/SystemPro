import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_cubit.dart';
import 'package:system_pro/features/Authentication/EmailVerify/logic/email_verify_state.dart';
import 'package:system_pro/features/Authentication/EmailVerify/ui/widgets/email_verify_view_body.dart';

class EmailVerifyBlocConsumer extends StatelessWidget {
  const EmailVerifyBlocConsumer({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
      listener: (context, state) {
        if (state is EmailVerifySuccess) {
          context.showSnackBar(
            context.localization.account_created_successfully,
          );
          context.pushReplacementNamed(Routes.loginView);
        }
        if (state is EmailVerifyError) {
          context.showSnackBar(state.error);
        }
        if (state is ResendOtpSuccess) {
          context.showSnackBar(
            context.localization.send_code,
          );
          
        }
      },
      builder: (context, state) {
        return LoadingIndicator(
          isLoading: state is EmailVerifyLoading ? true : false,
          child: EmailVerifyViewBody(email: email).allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
        );
      },
    );
  }
}
