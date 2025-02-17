import 'dart:ui';

/// {@template StringX}
/// TODO: Add description.
/// {@endtemplate}
extension StringX on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';

  String get unCapitalize => '${this[0].toLowerCase()}${substring(1)}';

  Color get toColorTask => Color(int.parse(replaceFirst('#', '0xFF')));
}
