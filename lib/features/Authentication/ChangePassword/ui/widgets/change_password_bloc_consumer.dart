import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_cubit.dart';
import 'package:system_pro/features/Authentication/ChangePassword/logic/change_password_state.dart';
import 'package:system_pro/features/Authentication/ChangePassword/ui/widgets/change_password_view_body.dart';

/// Widget that listens to change password state and shows loading / success / error UI
class ChangePasswordBlocConsumer extends StatelessWidget {
  const ChangePasswordBlocConsumer({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) async {
        if (state is ChangePasswordSuccess) {
          context.showSnackBar('Password changed successfully');

          await Future.delayed(const Duration(milliseconds: 500));

          // ✅ Guarding context usage after async gap
          if (context.mounted) {
            await context.pushReplacementNamed(Routes.passwordChangedView);
          }
        }

        if (state is ChangePasswordError) {
          if (context.mounted) {
            context.showSnackBar(state.error);
          }
        }
      },
      builder: (context, state) {
        return LoadingIndicatorOverlay(
          isLoading: state is ChangePasswordLoading,
          child: ChangePasswordViewBody(
            email: email,
            isLoading: state is ChangePasswordLoading,
          ).allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
        );
      },
    );
  }
}
