import 'package:flutter/material.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';

Map<String, String> filters(BuildContext context) => {
  context.localization.residentail: 'Residential',
  context.localization.commercial: 'Commercial',
  context.localization.lands: 'Land',
};

Map<String, String> filtersToggle(BuildContext context) => {
  context.localization.buy: 'buy',
  context.localization.rent: 'rent',
  context.localization.book: 'booking',
};
