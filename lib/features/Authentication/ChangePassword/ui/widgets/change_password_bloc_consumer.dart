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

class ChangePasswordBlocConsumer extends StatelessWidget {
  const ChangePasswordBlocConsumer({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          context.pushReplacementNamed(Routes.passwordChangedView);
        }
        if (state is ChangePasswordError) {
          context.showSnackBar(state.error);
        }
      },
      builder: (context, state) {
        return LoadingIndicator(
          isLoading: state is ChangePasswordLoading ? true : false,
          child: ChangePasswordViewBody(email: email).allPadding(
            vPadding: kPaddingLargeVertical,
            hPadding: kPaddingDefaultHorizontal,
          ),
        );
      },
    );
  }
}
