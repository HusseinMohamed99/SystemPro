// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in`
  String get login {
    return Intl.message('Log in', name: 'login', desc: '', args: []);
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get do_not_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'do_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get create_account {
    return Intl.message(
      'Create an Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get new_account {
    return Intl.message('New Account', name: 'new_account', desc: '', args: []);
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Already have an account?`
  String get have_account {
    return Intl.message(
      'Already have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to:`
  String get you_agree_to {
    return Intl.message(
      'By creating an account, you agree to:',
      name: 'you_agree_to',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otp {
    return Intl.message('OTP', name: 'otp', desc: '', args: []);
  }

  /// `Sign in successfully`
  String get sign_in_successfully {
    return Intl.message(
      'Sign in successfully',
      name: 'sign_in_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get account_created_successfully {
    return Intl.message(
      'Account created successfully',
      name: 'account_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Email can't be empty`
  String get email_empty {
    return Intl.message(
      'Email can\'t be empty',
      name: 'email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get email_valid {
    return Intl.message(
      'Please enter a valid email address',
      name: 'email_valid',
      desc: '',
      args: [],
    );
  }

  /// `Email already exists`
  String get email_already_exists {
    return Intl.message(
      'Email already exists',
      name: 'email_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Email must be at least 6 characters.`
  String get email_too_short {
    return Intl.message(
      'Email must be at least 6 characters.',
      name: 'email_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Email must be less than 320 characters.`
  String get email_too_long {
    return Intl.message(
      'Email must be less than 320 characters.',
      name: 'email_too_long',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot contain consecutive dots.`
  String get email_no_consecutive_dots {
    return Intl.message(
      'Email cannot contain consecutive dots.',
      name: 'email_no_consecutive_dots',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot start or end with special characters.`
  String get email_invalid_start_end {
    return Intl.message(
      'Email cannot start or end with special characters.',
      name: 'email_invalid_start_end',
      desc: '',
      args: [],
    );
  }

  /// `Invalid domain format.`
  String get email_invalid_domain {
    return Intl.message(
      'Invalid domain format.',
      name: 'email_invalid_domain',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address.`
  String get email_invalid_format {
    return Intl.message(
      'Enter a valid email address.',
      name: 'email_invalid_format',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get password_empty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get password_length {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'password_length',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don't match`
  String get password_does_not_match {
    return Intl.message(
      'Passwords don\'t match',
      name: 'password_does_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get password_missing_uppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'password_missing_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter`
  String get password_missing_lowercase {
    return Intl.message(
      'Password must contain at least one lowercase letter',
      name: 'password_missing_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get password_missing_number {
    return Intl.message(
      'Password must contain at least one number',
      name: 'password_missing_number',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character`
  String get password_missing_special {
    return Intl.message(
      'Password must contain at least one special character',
      name: 'password_missing_special',
      desc: '',
      args: [],
    );
  }

  /// `Full name can't be empty`
  String get full_name_empty {
    return Intl.message(
      'Full name can\'t be empty',
      name: 'full_name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Full name must be at least 3 characters`
  String get full_name_minimum_length {
    return Intl.message(
      'Full name must be at least 3 characters',
      name: 'full_name_minimum_length',
      desc: '',
      args: [],
    );
  }

  /// `Full name must be at most 20 characters`
  String get full_name_maximum_length {
    return Intl.message(
      'Full name must be at most 20 characters',
      name: 'full_name_maximum_length',
      desc: '',
      args: [],
    );
  }

  /// `Name can only contain letters`
  String get full_name_no_special_characters {
    return Intl.message(
      'Name can only contain letters',
      name: 'full_name_no_special_characters',
      desc: '',
      args: [],
    );
  }

  /// `Name cannot be only numbers`
  String get full_name_cannot_be_only_numbers {
    return Intl.message(
      'Name cannot be only numbers',
      name: 'full_name_cannot_be_only_numbers',
      desc: '',
      args: [],
    );
  }

  /// `Phone number can't be empty`
  String get phone_empty {
    return Intl.message(
      'Phone number can\'t be empty',
      name: 'phone_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get phone_valid {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'phone_valid',
      desc: '',
      args: [],
    );
  }

  /// `Phone number already exists`
  String get phone_already_exists {
    return Intl.message(
      'Phone number already exists',
      name: 'phone_already_exists',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid Egyptian mobile number.`
  String get phone_invalid_format {
    return Intl.message(
      'Please enter a valid Egyptian mobile number.',
      name: 'phone_invalid_format',
      desc: '',
      args: [],
    );
  }

  /// `OTP can't be empty`
  String get otp_empty {
    return Intl.message(
      'OTP can\'t be empty',
      name: 'otp_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid OTP`
  String get otp_valid {
    return Intl.message(
      'Please enter a valid OTP',
      name: 'otp_valid',
      desc: '',
      args: [],
    );
  }

  /// `OTP must be 4 digits`
  String get otp_length {
    return Intl.message(
      'OTP must be 4 digits',
      name: 'otp_length',
      desc: '',
      args: [],
    );
  }

  /// `OTP must contain only numbers.`
  String get otp_invalid_format {
    return Intl.message(
      'OTP must contain only numbers.',
      name: 'otp_invalid_format',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get weak_password_error {
    return Intl.message(
      'The password provided is too weak.',
      name: 'weak_password_error',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get email_already_inUse_error {
    return Intl.message(
      'The account already exists for that email.',
      name: 'email_already_inUse_error',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred, please try again later.`
  String get general_error {
    return Intl.message(
      'An error occurred, please try again later.',
      name: 'general_error',
      desc: '',
      args: [],
    );
  }

  /// `You must agree to the terms of conditions.`
  String get terms_of_conditions_error {
    return Intl.message(
      'You must agree to the terms of conditions.',
      name: 'terms_of_conditions_error',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get network_request_failed_message {
    return Intl.message(
      'Please check your internet connection',
      name: 'network_request_failed_message',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted.`
  String get invalid_email_message {
    return Intl.message(
      'The email address is badly formatted.',
      name: 'invalid_email_message',
      desc: '',
      args: [],
    );
  }

  /// `Email/password accounts are not enabled. Please enable it in Firebase.`
  String get operation_not_allowed_message {
    return Intl.message(
      'Email/password accounts are not enabled. Please enable it in Firebase.',
      name: 'operation_not_allowed_message',
      desc: '',
      args: [],
    );
  }

  /// `This user account has been disabled by an administrator.`
  String get user_disabled_message {
    return Intl.message(
      'This user account has been disabled by an administrator.',
      name: 'user_disabled_message',
      desc: '',
      args: [],
    );
  }

  /// `An internal error occurred. Please try again later.`
  String get internal_error_message {
    return Intl.message(
      'An internal error occurred. Please try again later.',
      name: 'internal_error_message',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again later.`
  String get too_many_requests_message {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'too_many_requests_message',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password. Please try again.`
  String get wrong_password_message {
    return Intl.message(
      'Incorrect password. Please try again.',
      name: 'wrong_password_message',
      desc: '',
      args: [],
    );
  }

  /// `No user found with this email.`
  String get user_not_found_message {
    return Intl.message(
      'No user found with this email.',
      name: 'user_not_found_message',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is incorrect`
  String get email_or_password_incorrect {
    return Intl.message(
      'Email or password is incorrect',
      name: 'email_or_password_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with a different credential.`
  String get account_exists_message {
    return Intl.message(
      'An account already exists with a different credential.',
      name: 'account_exists_message',
      desc: '',
      args: [],
    );
  }

  /// `The Google credential is invalid or expired.`
  String get invalid_credential_message {
    return Intl.message(
      'The Google credential is invalid or expired.',
      name: 'invalid_credential_message',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in canceled by the user.`
  String get cancel_by_user_message {
    return Intl.message(
      'Sign-in canceled by the user.',
      name: 'cancel_by_user_message',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message('My Account', name: 'my_account', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Theme Mode`
  String get theme_mode {
    return Intl.message('Theme Mode', name: 'theme_mode', desc: '', args: []);
  }

  /// `Personal Account`
  String get personal_account {
    return Intl.message(
      'Personal Account',
      name: 'personal_account',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_password {
    return Intl.message(
      'New Password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `About Us`
  String get about_us {
    return Intl.message('About Us', name: 'about_us', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Personal Profile`
  String get personal_profile {
    return Intl.message(
      'Personal Profile',
      name: 'personal_profile',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Enter your email`
  String get enter_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry! It happens. Please enter the email associated with your account.`
  String get forgot_password_subtitle {
    return Intl.message(
      'Don’t worry! It happens. Please enter the email associated with your account.',
      name: 'forgot_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message('Send Code', name: 'send_code', desc: '', args: []);
  }

  /// `Please check your email`
  String get check_email {
    return Intl.message(
      'Please check your email',
      name: 'check_email',
      desc: '',
      args: [],
    );
  }

  /// `We've sent a code to`
  String get we_sent_code {
    return Intl.message(
      'We\'ve sent a code to',
      name: 'we_sent_code',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Send code again`
  String get send_code_again {
    return Intl.message(
      'Send code again',
      name: 'send_code_again',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code?`
  String get not_receive_code {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'not_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Please type something you’ll remember`
  String get reset_password_subtitle {
    return Intl.message(
      'Please type something you’ll remember',
      name: 'reset_password_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Password changed`
  String get password_changed {
    return Intl.message(
      'Password changed',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully`
  String get password_changed_subtitle {
    return Intl.message(
      'Your password has been changed successfully',
      name: 'password_changed_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get back_to_login {
    return Intl.message(
      'Back to Login',
      name: 'back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Favorites`
  String get favorites {
    return Intl.message('Favorites', name: 'favorites', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
