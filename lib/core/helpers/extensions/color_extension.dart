import 'package:flutter/material.dart';

/// Extension on `String` to convert a hexadecimal color string (e.g., "#FFFFFF")
/// to a [Color] object that can be used in Flutter widgets.
///
/// Example:
/// ```dart
/// String hex = "#4287f5";
/// Color? color = hex.toColor()?? Colors.blue; // returns Color(0xFF4287F5)
/// ```
extension HexColorExtension on String {
  /// Converts a hexadecimal string to a [Color].
  ///
  /// Supports:
  /// - 6-character format: `"RRGGBB"` → assumed fully opaque
  /// - 8-character format: `"AARRGGBB"` → includes opacity
  ///
  /// Returns `null` if the string is invalid.
  Color? toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    throw FormatException('Invalid hex color format: $this');
  }
}
