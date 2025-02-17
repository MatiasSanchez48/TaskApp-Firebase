part of 'bloc_settings.dart';

/// {@template BlocSettingsState}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettingsState extends Equatable {
  /// {@macro BlocSettingsState}
  const BlocSettingsState._({
    this.isDarkMode = false,
    this.lenguage = Lenguage.es,
    this.theme,
  });

  BlocSettingsState.from(
    BlocSettingsState state, {
    bool? isDarkMode,
    Lenguage? lenguage,
    ThemeData? theme,
  }) : this._(
          theme: theme ?? state.theme,
          isDarkMode: isDarkMode ?? state.isDarkMode,
          lenguage: lenguage ?? state.lenguage,
        );

  ///
  final bool isDarkMode;

  ///
  final Lenguage lenguage;

  ///
  final ThemeData? theme;

  @override
  List<Object?> get props => [
        isDarkMode,
        lenguage,
        theme,
      ];
}

/// {@template BlocSettingsStateInitial}
/// TODO: Add description.
/// {@endtemplate}
final class BlocSettingsStateInitial extends BlocSettingsState {
  /// {@macro BlocSettingsStateInitial}
  const BlocSettingsStateInitial() : super._();
}

/// {@template BlocSettingsStateLoading}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettingsStateLoading extends BlocSettingsState {
  /// {@macro BlocSettingsStateLoading}
  BlocSettingsStateLoading.from(super.state) : super.from();
}

/// {@template BlocSettingsStateSuccess}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettingsStateSuccess extends BlocSettingsState {
  /// {@macro BlocSettingsStateSuccess}
  BlocSettingsStateSuccess.from(
    super.state, {
    super.isDarkMode,
    super.lenguage,
    super.theme,
  }) : super.from();
}

/// {@template BlocSettingsStateError}
/// TODO: Add description.
/// {@endtemplate}
class BlocSettingsStateError extends BlocSettingsState {
  /// {@macro BlocSettingsStateError}
  BlocSettingsStateError.from(super.state, this.message) : super.from();

  ///
  final String message;
}
