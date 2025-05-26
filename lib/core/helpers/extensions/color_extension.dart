import 'package:flutter/material.dart';

/// Extension on `String` to convert a hexadecimal color string (e.g., "#FFFFFF")
/// to a [Color] object that can be used in Flutter widgets.
/// String hex = "#4287f5";
/// Color color = hex.toColor();
/// returns Color(0xFF4287F5);
extension HexColorExtension on String {
  toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
  }
}
