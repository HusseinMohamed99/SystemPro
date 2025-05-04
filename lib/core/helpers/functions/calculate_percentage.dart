String calculatePercentage(String priceStr, String downPaymentStr) {
  // تحويل السعر والمقدم من String إلى double
  double price = double.tryParse(priceStr) ?? 0;
  double downPayment = double.tryParse(downPaymentStr) ?? 0;

  // التأكد من أن السعر أكبر من 0 لتجنب القسمة على صفر
  if (price <= 0) {
    throw ArgumentError('Price must be greater than 0');
  }

  // حساب النسبة
  double percentage = (downPayment / price) * 100;

  // تحديد رقمين بعد العلامة العشرية
  return '${percentage.toStringAsFixed(0)} %';
}

