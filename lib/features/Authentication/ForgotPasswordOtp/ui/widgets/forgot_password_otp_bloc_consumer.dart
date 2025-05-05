import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_cubit.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/logic/otp_state.dart';
import 'package:system_pro/features/Authentication/ForgotPasswordOtp/ui/widgets/forgot_password_otp_view_body.dart';

class ForgotPasswordOtpBlocConsumer extends StatelessWidget {
  const ForgotPasswordOtpBlocConsumer({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpSuccess) {
          context.showSnackBar(
            context.localization.send_code,
          );
       
        }
        if (state is OtpError) {
          context.showSnackBar(state.error);
        }
      },
      builder: (context, state) {
        return LoadingIndicator(
          isLoading: state is OtpLoading ? true : false,
          child:  ForgotPasswordOtpViewBody(email: email,).allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
        );
      },
    );
  }
}
