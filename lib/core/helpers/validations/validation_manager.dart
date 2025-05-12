import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';

class ValidationManager {
  // Validates display name
  static String? displayNameValidator(
    BuildContext context,
    String? displayName,
  ) {
    final localization = context.localization;
    // Trim the displayName to remove leading/trailing spaces
    displayName = displayName?.trim();
    // Check if the displayName is null, empty, or contains only whitespace
    if (displayName == null || displayName.isEmpty) {
      return localization.full_name_empty;
    }
    // Check if the displayName contains only numbers
    if (_containsOnlyNumbers(displayName)) {
      return localization.full_name_cannot_be_only_numbers;
    }
    // Check if the displayName contains only letters, numbers, and spaces
    if (!_containsValidCharacters(displayName)) {
      return localization.full_name_no_special_characters;
    }
    // Check if the displayName is at least 3 characters long
    if (displayName.length < 3) {
      return localization.full_name_minimum_length;
    }
    // Check if the displayName is no longer than 20 characters
    if (displayName.length > 20) {
      return localization.full_name_maximum_length;
    }
    // If all checks pass, return null (no error)
    return null;
  }

  // Validates Egyptian phone numbers
  static String? phoneValidator(BuildContext context, String? phone) {
    final localization = context.localization;
    // Trim the phone number to remove leading/trailing spaces
    phone = phone?.trim();
    // Check if the phone number is null, empty, or contains only whitespace
    if (phone == null || phone.isEmpty) {
      return localization.phone_empty;
    }
    // Check if the phone number matches the Egyptian phone number format
    if (!_isValidEgyptianPhoneNumber(phone)) {
      return localization.phone_invalid_format;
    }
    // If all checks pass, return null (no error)
    return null;
  }

  // Validates email addresses
  static String? emailValidator(BuildContext context, String? value) {
    final localization = context.localization;
    // Trim leading/trailing spaces
    value = value?.trim();
    if (value == null || value.isEmpty) {
      return localization.email_empty;
    }
    // Check minimum length (6) and maximum length (320)
    if (value.length < 6) {
      return localization.email_too_short;
    }
    if (value.length > 320) {
      return localization.email_too_long;
    }
    // No consecutive dots
    if (value.contains('..')) {
      return localization.email_no_consecutive_dots;
    }
    // No leading or trailing special characters
    if (RegExp(r'^[\.\-_]|[\.\-_]$').hasMatch(value)) {
      return localization.email_invalid_start_end;
    }
    // Validate domain part (no consecutive dots or invalid format)
    final parts = value.split('@');
    if (parts.length != 2 || parts[1].contains('..')) {
      return localization.email_invalid_domain;
    }
    // Validate using regex
    if (!isValidEmail(value)) {
      return localization.email_invalid_format;
    }
    return null; // No error
  }

  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  // Validates OTP codes
  static String? otpValidator(BuildContext context, String? value) {
    final localization = context.localization;
    // Trim the OTP to remove leading/trailing spaces
    value = value?.trim();
    // Check if the OTP is null, empty, or contains only whitespace
    if (value == null || value.isEmpty) {
      return localization.otp_empty;
    }
    // Check if the OTP contains only numbers
    if (!_containsOnlyNumbers(value)) {
      return localization.otp_invalid_format;
    }
    // If all checks pass, return null (no error)
    return null;
  }

  // Validates passwords
  static String? passwordValidator(BuildContext context, String? value) {
    final localization = context.localization;
    // Trim the password to remove leading/trailing spaces
    value = value?.trim();
    // Check if the password is null, empty, or contains only whitespace
    if (value == null || value.isEmpty) {
      return localization.password_empty;
    }
    // Check if the password meets all requirements
    if (!_isPasswordValid(value)) {
      if (!hasMinLength(value)) {
        return localization.password_length;
      }
      if (!hasLowerCase(value)) {
        return localization.password_missing_lowercase;
      }
      if (!hasUpperCase(value)) {
        return localization.password_missing_uppercase;
      }
      if (!hasNumber(value)) {
        return localization.password_missing_number;
      }
      if (!hasSpecialCharacter(value)) {
        return localization.password_missing_special;
      }
    }
    // If all checks pass, return null (no error)
    return null;
  }

  // Validates repeated passwords
  static String? repeatPasswordValidator(
    BuildContext context, {
    String? value,
    String? password,
  }) {
    final localization = context.localization;
    // Check if the repeated password matches the original password
    if (value != password) {
      return localization.password_does_not_match;
    }
    // If all checks pass, return null (no error)
    return null;
  }

  // Helper method to check if a string contains only numbers
  static bool _containsOnlyNumbers(String input) {
    final RegExp onlyNumbersRegex = RegExp(r'^[0-9]+$');
    return onlyNumbersRegex.hasMatch(input);
  }

  // Helper method to check if a string
  // contains only letters, numbers, and spaces
  static bool _containsValidCharacters(String input) {
    final RegExp validCharactersRegex = RegExp(r'^[a-zA-Z0-9 ]+$');
    return validCharactersRegex.hasMatch(input);
  }

  // Helper method to check if a phone number is a valid Egyptian mobile number
  static bool _isValidEgyptianPhoneNumber(String phone) {
    final RegExp regex = RegExp(r'^(010|011|012|015|016|017)[0-9]{8}$');
    return regex.hasMatch(phone);
  }

  // Helper method to check if a password is valid
  static bool _isPasswordValid(String password) {
    return hasMinLength(password) &&
        hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasNumber(password) &&
        hasSpecialCharacter(password);
  }

  // Helper method to check if a password has a minimum length of 8 characters
  static bool hasMinLength(String password) {
    return password.length >= 8;
  }

  // Helper method to check if a password contains at least one lowercase letter
  static bool hasLowerCase(String password) {
    return RegExp(r'[a-z]').hasMatch(password);
  }

  // Helper method to check if a password contains at least one uppercase letter
  static bool hasUpperCase(String password) {
    return RegExp(r'[A-Z]').hasMatch(password);
  }

  // Helper method to check if a password contains at least one number
  static bool hasNumber(String password) {
    return RegExp(r'[0-9]').hasMatch(password);
  }

  // Helper method to check if a password
  // contains at least one special character
  static bool hasSpecialCharacter(String password) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  }
}
