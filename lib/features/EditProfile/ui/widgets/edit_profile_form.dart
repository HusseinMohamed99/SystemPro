import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
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
    required this.cubit,
  });

  final String userName;
  final ProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    final bool isFormValid = cubit.userNameController.text.isNotEmpty;

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Full Name Input
          NameFormField(
            nameController: cubit.userNameController,
            focusNode: cubit.userNameFocusNode,
          ),

          const SizedBox(height: 24),

          // Save Button
          CustomButton(
            text: context.localization.save_changes,
            isLoading:
                cubit.state is EditProfileLoading, // Assume loading state
            isDisabled: !isFormValid,
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.updateUserProfile();
              }
            },
          ),

          const SizedBox(height: 32),

          // Delete Account Link
          TextButton(
            onPressed: () {
              cubit.emitDeleteAccountStates();
              DioFactory.clearAuthorizationHeader(); // Clear auth token
            },
            child: Text(
              context.localization.delete_my_account,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
