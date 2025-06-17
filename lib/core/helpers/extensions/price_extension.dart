import 'package:intl/intl.dart';

extension PriceFormatter on String {
  String formatPrice() {
    final formatter = NumberFormat('#,###', 'en_US');
    final value = double.tryParse(replaceAll(',', '')) ?? 0.0;
    return formatter.format(value);
  }
}
