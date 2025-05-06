import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/navigation_extension.dart';
import 'package:system_pro/core/helpers/extensions/snack_bar_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/name_form_field_widget.dart';
import 'package:system_pro/features/EditProfile/logic/edit_profile_cubit.dart';
import 'package:system_pro/features/EditProfile/logic/edit_profile_state.dart';

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
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileError) {
            context.showSnackBar(
              state.error,
            ); // لازم تكون عامل extension زي ما اتفقنا
          } else if (state is EditProfileSuccess) {
            context.showSnackBar('تم تحديث البيانات بنجاح');
           context.pop(); // أو أي action تاني
           
          }
        },
        builder: (context, state) {
          final cubit = context.read<EditProfileCubit>();
          if (cubit.userNameController.text.trim().isEmpty) {
            cubit.initializeUserName(userName);
          }

          return Form(
            key: cubit.formKey,
            child: Column(
              spacing: kSpacingXXXLarge.h,
              children: [
                NameFormField(
                  fullName: userName,
                  nameController: cubit.userNameController,
                  focusNode: cubit.userNameFocusNode,
                ),
                state is EditProfileLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                      text: context.localization.save_changes,
                      onPressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.updateUserProfile();
                        }
                      },
                    ),

                const Spacer(),
                TextButton(
                  onPressed: () {},
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
        },
      ).allPadding(
        vPadding: kPaddingLargeVertical,
        hPadding: kPaddingDefaultHorizontal,
      ),
    );
  }
}
