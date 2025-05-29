import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_cubit.dart';
import 'package:system_pro/features/Authentication/Login/logic/login_state.dart';
import 'package:system_pro/features/Authentication/Login/ui/widgets/login_view_body.dart';

/// Handles login state changes and builds the login form UI.
class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // Handle login success: show message and navigate
        if (state is LoginSuccess) {
          context
            ..showSnackBar(context.localization.sign_in_successfully)
            ..pushReplacementNamed(Routes.mainView);
        }
      },
      builder: (context, state) {
        final shouldShowLoading = state is LoginLoading;

        return LoadingIndicatorOverlay(
          isLoading: shouldShowLoading, // Show loading spinner if needed
          child: const LoginViewBody().allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
        );
      },
    );
  }
}
