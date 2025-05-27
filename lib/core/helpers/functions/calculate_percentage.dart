/// Calculates the percentage of the down payment from the total price.
///
/// [priceStr] and [downPaymentStr] should be valid numeric strings.
///
/// Returns a string like `"25.00 %"`.
///
/// Throws [ArgumentError] if price is zero or invalid,
///  or if down payment exceeds price.
String calculatePercentage(String priceStr, String downPaymentStr) {
  final double? price = double.tryParse(priceStr);
  final double? downPayment = double.tryParse(downPaymentStr);

  if (price == null || price <= 0) {
    throw ArgumentError('Price must be a valid number greater than 0');
  }

  if (downPayment == null || downPayment < 0) {
    throw ArgumentError('Down payment must be a valid non-negative number');
  }

  if (downPayment > price) {
    throw ArgumentError('Down payment cannot exceed price');
  }

  final double percentage = (downPayment / price) * 100;
  return '${percentage.toStringAsFixed(2)} %';
}
