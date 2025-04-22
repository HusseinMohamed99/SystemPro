import 'package:flutter/material.dart';

void onTextChanged({
  required String value,
  required TextEditingController controller,
}) {
  final String newValue = value.replaceAll(' ', '');
  if (newValue != value) {
    controller.value = controller.value.copyWith(
      text: newValue,
      selection: TextSelection.fromPosition(
        TextPosition(offset: newValue.length),
      ),
    );
  }
}
