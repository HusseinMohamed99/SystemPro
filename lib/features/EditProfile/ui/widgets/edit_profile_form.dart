import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/networking/backend/dio_factory.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/name_form_field_widget.dart';
import 'package:system_pro/features/Home/logic/profile_cubit.dart';

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
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          NameFormField(
            fullName: userName,
            nameController: cubit.userNameController,
            focusNode: cubit.userNameFocusNode,
          ),
          const SizedBox(height: 24),
          CustomButton(
            text: context.localization.save_changes,
            onPressed: () {
              if (cubit.formKey.currentState!.validate()) {
                cubit.updateUserProfile();
              }
            },
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              cubit.emitDeleteAccountStates();
              DioFactory.clearAuthorizationHeader();
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
