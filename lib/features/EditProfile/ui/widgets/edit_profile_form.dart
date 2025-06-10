import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/responsive/spacing.dart';
import 'package:system_pro/core/networking/backend/dio_factory.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/name_form_field_widget.dart';
import 'package:system_pro/features/EditProfile/logic/edit_profile_state.dart';
import 'package:system_pro/features/Home/logic/Profile/profile_cubit.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.userName,
    required this.profileCubit,
  });
  final String userName;
  final ProfileCubit profileCubit;
  @override
  Widget build(BuildContext context) {
    final bool isFormValid = profileCubit.userNameController.text.isNotEmpty;
    return Form(
      key: profileCubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full Name Input
          NameFormField(
            nameController: profileCubit.userNameController,
            focusNode: profileCubit.userNameFocusNode,
          ),
          verticalSpacing(kSpacingXLarge),
          // Save Button
          CustomButton(
            text: context.localization.save_changes,
            isLoading:
                profileCubit.state
                    is EditProfileLoading, // Assume loading state
            isDisabled: !isFormValid,
            onPressed: () {
              if (profileCubit.formKey.currentState!.validate()) {
                profileCubit.updateUserProfile();
              }
            },
          ),
          verticalSpacing(kSpacingXXLarge),
          // Delete Account Link
          TextButton(
            onPressed: () {
              profileCubit.emitDeleteAccountStates();
              DioFactory.clearAuthorizationHeader(); // Clear auth token
            },
            child: Text(
              context.localization.delete_my_account,
              style: context.titleLarge?.copyWith(
                fontWeight: FontWeightHelper.medium,
                color: ColorManager.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
