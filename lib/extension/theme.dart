import 'package:flutter/material.dart';

/// {@template ColorSchemeX}
/// TODO: Add description.
/// {@endtemplate}
extension ColorSchemeX on ColorScheme {
  Color get primaryTitle => primary.withValues(alpha: 0.8);

  Color get desactivated => Colors.grey.withValues(alpha: 0.5);

  Color get greyCustom => onTertiary.withValues(alpha: 0.3);
}
