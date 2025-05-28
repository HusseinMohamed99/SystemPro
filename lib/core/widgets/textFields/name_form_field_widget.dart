import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/extensions/theming_extension.dart';
import 'package:system_pro/core/helpers/validations/validation_manager.dart';
import 'package:system_pro/core/widgets/textFields/custom_text_form_field.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    super.key,
    required this.nameController,
    required this.focusNode,
    this.fullName,
  });
  final TextEditingController nameController;
  final FocusNode focusNode;
  final String? fullName;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.localization.full_name, style: context.titleMedium),
        CustomTextFormField(
          autofillHints: const [AutofillHints.name],
          focusNode: focusNode,
          controller: nameController,
          validator: (value) {
            return ValidationManager.displayNameValidator(context, value ?? '');
          },
          textInputType: TextInputType.name,
          hintText: fullName ?? context.localization.full_name,
        ),
      ],
    );
  }
}
