// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} days ago";

  static String m1(count) => "${count} hours ago";

  static String m2(count) => "${count} minutes ago";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "about_us": MessageLookupByLibrary.simpleMessage("About Us"),
    "account_created_successfully": MessageLookupByLibrary.simpleMessage(
      "Account created successfully",
    ),
    "account_exists_message": MessageLookupByLibrary.simpleMessage(
      "An account already exists with a different credential.",
    ),
    "amenities": MessageLookupByLibrary.simpleMessage("Amenities"),
    "any": MessageLookupByLibrary.simpleMessage("Any"),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "back_to_login": MessageLookupByLibrary.simpleMessage("Back to Login"),
    "bathrooms": MessageLookupByLibrary.simpleMessage("Bathrooms"),
    "bedrooms": MessageLookupByLibrary.simpleMessage("Bedrooms"),
    "book": MessageLookupByLibrary.simpleMessage("Booking"),
    "buy": MessageLookupByLibrary.simpleMessage("Buy"),
    "call": MessageLookupByLibrary.simpleMessage("Call"),
    "call_permission_denied": MessageLookupByLibrary.simpleMessage(
      "Call Permission Denied",
    ),
    "cancel_by_user_message": MessageLookupByLibrary.simpleMessage(
      "Sign-in canceled by the user.",
    ),
    "change": MessageLookupByLibrary.simpleMessage("Change"),
    "change_password": MessageLookupByLibrary.simpleMessage("Change Password"),
    "check_email": MessageLookupByLibrary.simpleMessage(
      "Please check your email",
    ),
    "clear_all": MessageLookupByLibrary.simpleMessage("Clear All"),
    "close_app": MessageLookupByLibrary.simpleMessage("Close App"),
    "commercial": MessageLookupByLibrary.simpleMessage("Commercial"),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "contact_us": MessageLookupByLibrary.simpleMessage("Contact Us"),
    "create_account": MessageLookupByLibrary.simpleMessage("Create an Account"),
    "create_new_account": MessageLookupByLibrary.simpleMessage(
      "Create New Account",
    ),
    "current_password": MessageLookupByLibrary.simpleMessage(
      "Current Password",
    ),
    "dark_mode": MessageLookupByLibrary.simpleMessage("Dark"),
    "daysAgo": m0,
    "delete_account_successfully": MessageLookupByLibrary.simpleMessage(
      "Account deleted successfully",
    ),
    "delete_my_account": MessageLookupByLibrary.simpleMessage(
      "Delete My Account",
    ),
    "deleting_account": MessageLookupByLibrary.simpleMessage(
      "Deleting Account",
    ),
    "description": MessageLookupByLibrary.simpleMessage("Description"),
    "do_not_have_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "down_payment": MessageLookupByLibrary.simpleMessage("Down Payment"),
    "edit_profile": MessageLookupByLibrary.simpleMessage("Edit Profile"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "email_already_exists": MessageLookupByLibrary.simpleMessage(
      "Email already exists",
    ),
    "email_already_inUse_error": MessageLookupByLibrary.simpleMessage(
      "The account already exists for that email.",
    ),
    "email_empty": MessageLookupByLibrary.simpleMessage(
      "Email can\'t be empty",
    ),
    "email_invalid_domain": MessageLookupByLibrary.simpleMessage(
      "Invalid domain format.",
    ),
    "email_invalid_format": MessageLookupByLibrary.simpleMessage(
      "Enter a valid email address.",
    ),
    "email_invalid_start_end": MessageLookupByLibrary.simpleMessage(
      "Email cannot start or end with special characters.",
    ),
    "email_no_consecutive_dots": MessageLookupByLibrary.simpleMessage(
      "Email cannot contain consecutive dots.",
    ),
    "email_or_password_incorrect": MessageLookupByLibrary.simpleMessage(
      "Email or password is incorrect",
    ),
    "email_too_long": MessageLookupByLibrary.simpleMessage(
      "Email must be less than 320 characters.",
    ),
    "email_too_short": MessageLookupByLibrary.simpleMessage(
      "Email must be at least 6 characters.",
    ),
    "email_valid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enter_email": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "enter_password": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "errorBadRequest": MessageLookupByLibrary.simpleMessage(
      "Invalid request. Please check your inputs.",
    ),
    "errorCache": MessageLookupByLibrary.simpleMessage(
      "Unable to load cached data.",
    ),
    "errorConflict": MessageLookupByLibrary.simpleMessage(
      "Conflict detected. Please try again later.",
    ),
    "errorDefault": MessageLookupByLibrary.simpleMessage(
      "Something went wrong. Please try again later.",
    ),
    "errorForbidden": MessageLookupByLibrary.simpleMessage(
      "Access forbidden. Please check your permissions.",
    ),
    "errorInternalServer": MessageLookupByLibrary.simpleMessage(
      "Server encountered an error. Please try again later.",
    ),
    "errorNoContent": MessageLookupByLibrary.simpleMessage(
      "No content available.",
    ),
    "errorNoInternet": MessageLookupByLibrary.simpleMessage(
      "No internet connection. Check your network.",
    ),
    "errorNotFound": MessageLookupByLibrary.simpleMessage(
      "Requested resource not found.",
    ),
    "errorTimeout": MessageLookupByLibrary.simpleMessage(
      "Request timed out. Please check your internet connection.",
    ),
    "errorUnauthorized": MessageLookupByLibrary.simpleMessage(
      "Unauthorized access. Please login again.",
    ),
    "errorUnknown": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred. Please try again.",
    ),
    "failed_to_upload_image": MessageLookupByLibrary.simpleMessage(
      "Image not available",
    ),
    "favorites": MessageLookupByLibrary.simpleMessage("Favorites"),
    "filter": MessageLookupByLibrary.simpleMessage("Filter"),
    "find": MessageLookupByLibrary.simpleMessage("Find"),
    "for_to": MessageLookupByLibrary.simpleMessage("For"),
    "forgot_password": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "forgot_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Don’t worry! It happens. Please enter the email associated with your account.",
    ),
    "full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
    "full_name_cannot_be_only_numbers": MessageLookupByLibrary.simpleMessage(
      "Name cannot be only numbers",
    ),
    "full_name_empty": MessageLookupByLibrary.simpleMessage(
      "Full name can\'t be empty",
    ),
    "full_name_maximum_length": MessageLookupByLibrary.simpleMessage(
      "Full name must be at most 20 characters",
    ),
    "full_name_minimum_length": MessageLookupByLibrary.simpleMessage(
      "Full name must be at least 3 characters",
    ),
    "full_name_no_special_characters": MessageLookupByLibrary.simpleMessage(
      "Name can only contain letters",
    ),
    "general": MessageLookupByLibrary.simpleMessage("General"),
    "general_error": MessageLookupByLibrary.simpleMessage(
      "An error occurred, please try again later.",
    ),
    "have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "help": MessageLookupByLibrary.simpleMessage("Help"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "hoursAgo": m1,
    "init_error_title": MessageLookupByLibrary.simpleMessage(
      "An error occurred while initializing the app",
    ),
    "internal_error_message": MessageLookupByLibrary.simpleMessage(
      "An internal error occurred. Please try again later.",
    ),
    "invalid_credential_message": MessageLookupByLibrary.simpleMessage(
      "The Google credential is invalid or expired.",
    ),
    "invalid_email_message": MessageLookupByLibrary.simpleMessage(
      "The email address is badly formatted.",
    ),
    "invalid_link": MessageLookupByLibrary.simpleMessage("Invalid Link"),
    "justNow": MessageLookupByLibrary.simpleMessage("Just now"),
    "lands": MessageLookupByLibrary.simpleMessage("Lands"),
    "lands_type": MessageLookupByLibrary.simpleMessage("Lands Type"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "light_mode": MessageLookupByLibrary.simpleMessage("Light"),
    "listed_by": MessageLookupByLibrary.simpleMessage("Listed by"),
    "loading": MessageLookupByLibrary.simpleMessage("Loading, please wait..."),
    "location": MessageLookupByLibrary.simpleMessage("Location"),
    "login": MessageLookupByLibrary.simpleMessage("Log in"),
    "logout": MessageLookupByLibrary.simpleMessage("Log out"),
    "logout_successfully": MessageLookupByLibrary.simpleMessage(
      "Logged out successfully",
    ),
    "max": MessageLookupByLibrary.simpleMessage("Max"),
    "min": MessageLookupByLibrary.simpleMessage("Min"),
    "minutesAgo": m2,
    "my_account": MessageLookupByLibrary.simpleMessage("My Account"),
    "network_request_failed_message": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection",
    ),
    "new_account": MessageLookupByLibrary.simpleMessage("New Account"),
    "new_password": MessageLookupByLibrary.simpleMessage("New Password"),
    "newest": MessageLookupByLibrary.simpleMessage("Newest"),
    "no_available_properties": MessageLookupByLibrary.simpleMessage(
      "No Available Properties",
    ),
    "no_data_found": MessageLookupByLibrary.simpleMessage("No Data Found"),
    "no_favorite_properties": MessageLookupByLibrary.simpleMessage(
      "No Favorite Properties",
    ),
    "no_result": MessageLookupByLibrary.simpleMessage("No Result"),
    "not_receive_code": MessageLookupByLibrary.simpleMessage(
      "Didn\'t receive code?",
    ),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "ok": MessageLookupByLibrary.simpleMessage("OK"),
    "oldest": MessageLookupByLibrary.simpleMessage("Oldest"),
    "oneDayAgo": MessageLookupByLibrary.simpleMessage("1 day ago"),
    "oneHourAgo": MessageLookupByLibrary.simpleMessage("1 hour ago"),
    "oneMinuteAgo": MessageLookupByLibrary.simpleMessage("1 minute ago"),
    "operation_not_allowed_message": MessageLookupByLibrary.simpleMessage(
      "Email/password accounts are not enabled. Please enable it in Firebase.",
    ),
    "otp": MessageLookupByLibrary.simpleMessage("OTP"),
    "otp_empty": MessageLookupByLibrary.simpleMessage("OTP can\'t be empty"),
    "otp_invalid_format": MessageLookupByLibrary.simpleMessage(
      "OTP must contain only numbers.",
    ),
    "otp_length": MessageLookupByLibrary.simpleMessage("OTP must be 4 digits"),
    "otp_valid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid OTP",
    ),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_changed": MessageLookupByLibrary.simpleMessage(
      "Password changed",
    ),
    "password_changed_subtitle": MessageLookupByLibrary.simpleMessage(
      "Your password has been changed successfully",
    ),
    "password_does_not_match": MessageLookupByLibrary.simpleMessage(
      "Passwords don\'t match",
    ),
    "password_empty": MessageLookupByLibrary.simpleMessage(
      "Password can\'t be empty",
    ),
    "password_length": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters",
    ),
    "password_missing_lowercase": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one lowercase letter",
    ),
    "password_missing_number": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one number",
    ),
    "password_missing_special": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one special character",
    ),
    "password_missing_uppercase": MessageLookupByLibrary.simpleMessage(
      "Password must contain at least one uppercase letter",
    ),
    "permission_required": MessageLookupByLibrary.simpleMessage(
      "Permission is required to perform this action.",
    ),
    "permission_required_hint": MessageLookupByLibrary.simpleMessage(
      "Please grant the required permission in settings.",
    ),
    "personal_account": MessageLookupByLibrary.simpleMessage(
      "Personal Account",
    ),
    "personal_information": MessageLookupByLibrary.simpleMessage(
      "Personal Information",
    ),
    "personal_profile": MessageLookupByLibrary.simpleMessage(
      "Personal Profile",
    ),
    "phone_already_exists": MessageLookupByLibrary.simpleMessage(
      "Phone number already exists",
    ),
    "phone_empty": MessageLookupByLibrary.simpleMessage(
      "Phone number can\'t be empty",
    ),
    "phone_invalid_format": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid Egyptian mobile number.",
    ),
    "phone_number": MessageLookupByLibrary.simpleMessage("Phone Number"),
    "phone_valid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid phone number",
    ),
    "price_high": MessageLookupByLibrary.simpleMessage("Price(High)"),
    "price_low": MessageLookupByLibrary.simpleMessage("Price(Low)"),
    "price_range": MessageLookupByLibrary.simpleMessage("Price Range"),
    "privacy_policy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "properties": MessageLookupByLibrary.simpleMessage("Properties"),
    "property_added_to_favorites": MessageLookupByLibrary.simpleMessage(
      "Property added to favorites",
    ),
    "property_removed_from_favorites": MessageLookupByLibrary.simpleMessage(
      "Property removed from favorites",
    ),
    "property_size": MessageLookupByLibrary.simpleMessage("Property Size"),
    "property_type": MessageLookupByLibrary.simpleMessage("Property Type"),
    "purpose": MessageLookupByLibrary.simpleMessage("Purpose"),
    "read_less": MessageLookupByLibrary.simpleMessage("Read Less"),
    "recent_search": MessageLookupByLibrary.simpleMessage("Recent Search"),
    "rent": MessageLookupByLibrary.simpleMessage("Rent"),
    "required_field": MessageLookupByLibrary.simpleMessage(
      "This field is required",
    ),
    "reset_password": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "reset_password_subtitle": MessageLookupByLibrary.simpleMessage(
      "Please type something you’ll remember",
    ),
    "reset_sort": MessageLookupByLibrary.simpleMessage("Reset Sort"),
    "residentail": MessageLookupByLibrary.simpleMessage("Residential"),
    "result": MessageLookupByLibrary.simpleMessage("Result"),
    "results_search": MessageLookupByLibrary.simpleMessage("Results Search"),
    "retry": MessageLookupByLibrary.simpleMessage("Please try again."),
    "sale": MessageLookupByLibrary.simpleMessage("Sale"),
    "sar": MessageLookupByLibrary.simpleMessage("SAR"),
    "save_changes": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "see_location": MessageLookupByLibrary.simpleMessage("See Location"),
    "see_more": MessageLookupByLibrary.simpleMessage("See More"),
    "see_more_amenities": MessageLookupByLibrary.simpleMessage(
      "See More Amenities",
    ),
    "see_more_property_type": MessageLookupByLibrary.simpleMessage(
      "See More Property Type",
    ),
    "select_location": MessageLookupByLibrary.simpleMessage(
      "Please select a location first",
    ),
    "send_code": MessageLookupByLibrary.simpleMessage("Send Code"),
    "send_code_again": MessageLookupByLibrary.simpleMessage("Send code again"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "show_less": MessageLookupByLibrary.simpleMessage("Show Less"),
    "sign_in_successfully": MessageLookupByLibrary.simpleMessage(
      "Sign in successfully",
    ),
    "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "terms_of_conditions_error": MessageLookupByLibrary.simpleMessage(
      "You must agree to the terms of conditions.",
    ),
    "terms_of_service": MessageLookupByLibrary.simpleMessage(
      "Terms of Service",
    ),
    "terms_of_use": MessageLookupByLibrary.simpleMessage("Terms of Use"),
    "theme_mode": MessageLookupByLibrary.simpleMessage("Theme Mode"),
    "too_many_requests_message": MessageLookupByLibrary.simpleMessage(
      "Too many requests. Please try again later.",
    ),
    "try_again": MessageLookupByLibrary.simpleMessage("Try Again"),
    "unable_to_call": MessageLookupByLibrary.simpleMessage("Unable to Call"),
    "unable_to_call_message": MessageLookupByLibrary.simpleMessage(
      "Please allow call permission from settings",
    ),
    "unable_to_open_link": MessageLookupByLibrary.simpleMessage(
      "Unable to open link:",
    ),
    "unknown_error": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please close the app and try again.",
    ),
    "update_data_successfully": MessageLookupByLibrary.simpleMessage(
      "Data updated successfully",
    ),
    "user_disabled_message": MessageLookupByLibrary.simpleMessage(
      "This user account has been disabled by an administrator.",
    ),
    "user_not_found_message": MessageLookupByLibrary.simpleMessage(
      "No user found with this email.",
    ),
    "verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "view_profile": MessageLookupByLibrary.simpleMessage("View Profile"),
    "we_sent_code": MessageLookupByLibrary.simpleMessage(
      "We\'ve sent a code to",
    ),
    "weak_password_error": MessageLookupByLibrary.simpleMessage(
      "The password provided is too weak.",
    ),
    "whatsApp": MessageLookupByLibrary.simpleMessage("WhatsApp"),
    "wrong_password_message": MessageLookupByLibrary.simpleMessage(
      "Incorrect password. Please try again.",
    ),
    "you_agree_to": MessageLookupByLibrary.simpleMessage(
      "By creating an account, you agree to:",
    ),
  };
}
