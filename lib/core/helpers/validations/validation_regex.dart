/// Contains all reusable regular expressions used for validation.
class ValidationRegex {
  static final onlyNumbers = RegExp(r'^[0-9]+$');
  static final validCharacters = RegExp(r'^[\u0621-\u064Aa-zA-Z0-9 .\-]+$');
  static final email = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final startEndSpecial = RegExp(r'^[\.\-_]|[\.\-_]$');
  static final egyptPhone = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  static final saudiPhone = RegExp(r'^(?:\+966|00966|0)?5[0-9]{8}$');

  static final lowerCase = RegExp(r'[a-z]');
  static final upperCase = RegExp(r'[A-Z]');
  static final number = RegExp(r'[0-9]');
  static final specialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
}
