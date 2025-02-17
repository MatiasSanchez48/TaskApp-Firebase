import 'package:flutter/material.dart';

/// {@template ColorX}
/// TODO: Add description.
/// {@endtemplate}
extension ColorX on Color {
  String get colorHex {
    final red = (r * 255).toInt();
    final green = (g * 255).toInt();
    final blue = (b * 255).toInt();

    return '#${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }
}
