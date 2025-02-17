import 'package:intl/intl.dart';

/// {@template DatetimeX}
/// TODO: Add description.
/// {@endtemplate}
extension DatetimeX on DateTime {
  String get formatDMYhs => DateFormat('dd/MM/yyyy HH:mm').format(this);

  String get formatDMY => DateFormat('dd/MM/yyyy').format(this);
}
