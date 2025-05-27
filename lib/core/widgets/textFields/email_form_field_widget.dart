import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:system_pro/core/helpers/dimensions/dimensions.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/functions/remove_spacing.dart';
import 'package:system_pro/core/helpers/validations/validation_manager.dart';
import 'package:system_pro/core/widgets/textFields/custom_text_form_field.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    required this.emailController,
    required this.focusNode,
  });

  final TextEditingController emailController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: kSpacingSmall.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.email,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CustomTextFormField(
          focusNode: focusNode,
          controller: emailController,
          onSaved: (value) => emailController.text = value!,
          validator: (value) {
            return ValidationManager.emailValidator(context, value!);
          },
          textInputType: TextInputType.emailAddress,
          hintText: context.localization.email,
          onChanged: (value) {
            emailController.removeSpaces();
          },
        ),
      ],
    );
  }
}
