import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';
import 'package:system_pro/core/helpers/validations/validation_regex.dart';

/// A utility class to validate common
/// form inputs like name, phone, email, password, etc.
class ValidationManager {
  /// Validates full name input. Ensures min/max length, valid characters, and not just numbers.
  static String? displayNameValidator(BuildContext context, String? value) {
    final t = context.localization;
    final name = value?.trim();

    if (name == null || name.isEmpty) return t.full_name_empty;
    if (ValidationRegex.onlyNumbers.hasMatch(name)) {
      return t.full_name_cannot_be_only_numbers;
    }
    if (!ValidationRegex.validCharacters.hasMatch(name)) {
      return t.full_name_no_special_characters;
    }
    if (name.length < 3) return t.full_name_minimum_length;
    if (name.length > 20) return t.full_name_maximum_length;

    return null;
  }

  /// Validates Egyptian and Saudi phone numbers using their respective formats.
  static String? phoneValidator(BuildContext context, String? value) {
    final t = context.localization;
    final phone = value?.trim();

    if (phone == null || phone.isEmpty) return t.phone_empty;

    final isEgyptian = ValidationRegex.egyptPhone.hasMatch(phone);
    final isSaudi = ValidationRegex.saudiPhone.hasMatch(phone);

    if (!isEgyptian && !isSaudi) return t.phone_invalid_format;

    return null;
  }

  /// Validates email with standard RFC rules and formatting constraints.
  static String? emailValidator(BuildContext context, String? value) {
    final t = context.localization;
    final email = value?.trim();

    if (email == null || email.isEmpty) return t.email_empty;
    if (email.length < 6) return t.email_too_short;
    if (email.length > 320) return t.email_too_long;
    if (email.contains('..')) return t.email_no_consecutive_dots;
    if (ValidationRegex.startEndSpecial.hasMatch(email)) {
      return t.email_invalid_start_end;
    }

    final parts = email.split('@');
    if (parts.length != 2 || parts[1].contains('..')) {
      return t.email_invalid_domain;
    }
    if (!ValidationRegex.email.hasMatch(email)) return t.email_invalid_format;

    return null;
  }

  /// Validates numeric OTP codes only.
static String? otpValidator(BuildContext context, String? value) {
    final t = context.localization;
    final otp = value?.trim() ?? '';

    if (otp.isEmpty) return t.otp_empty;

    // Example: Accepts only 4-digit numeric OTPs
    if (!ValidationRegex.otpRegex.hasMatch(otp)) return t.otp_invalid_format;

    return null;
  }


  /// Validates strong password: includes upper/lower, digit, special char, min 8.
  static String? passwordValidator(BuildContext context, String? value) {
    final t = context.localization;
    final password = value?.trim();

    if (password == null || password.isEmpty) return t.password_empty;
    if (password.length < 8) return t.password_length;
    if (!ValidationRegex.lowerCase.hasMatch(password)) {
      return t.password_missing_lowercase;
    }
    if (!ValidationRegex.upperCase.hasMatch(password)) {
      return t.password_missing_uppercase;
    }
    if (!ValidationRegex.number.hasMatch(password)) {
      return t.password_missing_number;
    }
    if (!ValidationRegex.specialChar.hasMatch(password)) {
      return t.password_missing_special;
    }

    return null;
  }

  /// Compares two password fields for equality.
  static String? repeatPasswordValidator(
    BuildContext context, {
    required String? value,
    required String? password,
  }) {
    final t = context.localization;
    if (value != password) return t.password_does_not_match;
    return null;
  }
}
