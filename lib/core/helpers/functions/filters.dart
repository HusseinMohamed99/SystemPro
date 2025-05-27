import 'package:flutter/material.dart';
import 'package:system_pro/core/enum/enum.dart';
import 'package:system_pro/core/helpers/extensions/localization_extension.dart';



/// Returns the localized label for [FilterType] to show in the UI.
String filterTypeLabel(BuildContext context, FilterType type) {
  switch (type) {
    case FilterType.residential:
      return context.localization.residentail;
    case FilterType.commercial:
      return context.localization.commercial;
    case FilterType.land:
      return context.localization.lands;
  }
}

/// Returns the backend string value for [FilterType].
String filterTypeValue(FilterType type) {
  switch (type) {
    case FilterType.residential:
      return 'Residential';
    case FilterType.commercial:
      return 'Commercial';
    case FilterType.land:
      return 'Land';
  }
}

/// Returns the localized label for [FilterToggle] to show in the UI.
String filterToggleLabel(BuildContext context, FilterToggle toggle) {
  switch (toggle) {
    case FilterToggle.buy:
      return context.localization.buy;
    case FilterToggle.rent:
      return context.localization.rent;
    case FilterToggle.booking:
      return context.localization.book;
  }
}

/// Returns the backend string value for [FilterToggle].
String filterToggleValue(FilterToggle toggle) {
  switch (toggle) {
    case FilterToggle.buy:
      return 'buy';
    case FilterToggle.rent:
      return 'rent';
    case FilterToggle.booking:
      return 'booking';
  }
}
