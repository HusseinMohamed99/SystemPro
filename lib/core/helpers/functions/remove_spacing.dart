import 'package:flutter/material.dart';
extension TextControllerSanitizer on TextEditingController {
  /// Removes all types of whitespace characters from the current text,
  /// including spaces, tabs, and newlines.
  ///
  /// Use this inside `onChanged` to automatically clean the input.
  void removeSpaces() {
    // Replace all whitespace characters (spaces, tabs, newlines) with an empty string
    final newValue = text.replaceAll(RegExp(r'\s+'), '');

    // If the cleaned value differs from the original, update the controller
    if (newValue != text) {
      value = value.copyWith(
        text: newValue,
        // Place the cursor at the end of the new text
        selection: TextSelection.collapsed(offset: newValue.length),
      );
    }
  }
}
