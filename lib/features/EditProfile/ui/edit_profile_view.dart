import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/routing/routes.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/indicators/custom_loading_indicator.dart';
import 'package:system_pro/features/EditProfile/ui/widgets/edit_profile_form.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_state.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.userName});
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSecondaryAppBar(
        context,
        title: context.localization.edit_profile,
      ),
      body: BlocConsumer<ProfileCubit, ProfileDataState>(
        listener: (context, state) {
          if (state is EditProfileError) {
            context.showSnackBar(state.error);
          } else if (state is EditProfileSuccess) {
            context.showSnackBar(context.localization.update_data_successfully);
            Navigator.pop(context, true);
          } else if (state is DeleteAccountSuccess) {
            context.showSnackBar(
              context.localization.delete_account_successfully,
            );
            context.pushNamedAndRemoveUntil(
              Routes.loginView,
              predicate: (route) => false,
            );
          }
        },
        builder: (context, state) {
          final profileCubit = context.read<ProfileCubit>();

          if (profileCubit.userNameController.text.trim().isEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              profileCubit.initializeUserName(userName);
            });
          }

          return LoadingIndicatorOverlay(
            isLoading:
                state is EditProfileLoading || state is DeleteAccountLoading,
            child: EditProfileForm(
              userName: userName,
              profileCubit: profileCubit,
            ).allPadding(
              vPadding: kPaddingLargeVertical,
              hPadding: kPaddingDefaultHorizontal,
            ),
          );
        },
      ),
    );
  }
}
