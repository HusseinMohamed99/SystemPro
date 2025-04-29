import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/widget_extension.dart';
import 'package:system_pro/core/theming/colorsManager/color_manager.dart';
import 'package:system_pro/core/theming/styleManager/font_weight.dart';
import 'package:system_pro/core/widgets/appBars/custom_secondary_app_bar.dart';
import 'package:system_pro/core/widgets/buttons/custom_button.dart';
import 'package:system_pro/core/widgets/textFields/name_form_field_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customSecondaryAppBar(
        context,
        title: context.localization.edit_profile,
      ), 
      body: Column(
        spacing: kSpacingXXXLarge.h,
        children: [
          NameFormField(
            nameController: TextEditingController(),
            focusNode: FocusNode(),
          ),
          CustomButton(
            text: context.localization.save_changes,
            onPressed: () {},
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
      ).allPadding(
        vPadding: kPaddingLargeVertical,
        hPadding: kPaddingDefaultHorizontal,
      ),
    );
  }
}
