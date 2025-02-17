part of 'bloc_settings.dart';

/// {@template BlocSettingsEvent}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettingsEvent extends Equatable {
  /// {@macro BlocSettingsEvent}
  const BlocSettingsEvent();

  @override
  List<Object> get props => [];
}

/// {@template BlocSettingsEventChangeTheme}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettingsEventChangeTheme extends BlocSettingsEvent {
  /// {@macro BlocSettingsEventChangeTheme}
  const BlocSettingsEventChangeTheme({required this.isDarkMode});

  ///
  final bool isDarkMode;
}

/// {@template BlocSettingsEventChangeLenguage}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettingsEventChangeLenguage extends BlocSettingsEvent {
  /// {@macro BlocSettingsEventChangeLenguage}
  const BlocSettingsEventChangeLenguage({required this.lenguage});

  ///
  final Lenguage lenguage;
}
