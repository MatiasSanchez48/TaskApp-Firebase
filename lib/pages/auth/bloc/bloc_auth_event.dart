part of 'bloc_auth.dart';

/// {@template BlocAuthEvent}
/// TODO: Add description.
/// {@endtemplate}
@immutable
abstract class BlocAuthEvent extends Equatable {
  /// {@macro BlocAuthEvent}
  const BlocAuthEvent();

  @override
  List<Object> get props => [];
}

/// {@template BlocAuthLoginWithCredentialsEvent}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthLoginWithCredentialsEvent extends BlocAuthEvent {
  /// {@macro BlocAuthLoginWithCredentialsEvent}
  const BlocAuthLoginWithCredentialsEvent({
    required this.email,
    required this.password,
  });

  ///
  final String? email;

  ///
  final String? password;
}

/// {@template BlocAuthRegisterWithCredentialsEvent}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthRegisterWithCredentialsEvent extends BlocAuthEvent {
  /// {@macro BlocAuthRegisterWithCredentialsEvent}
  const BlocAuthRegisterWithCredentialsEvent({
    required this.email,
    required this.password,
  });

  ///
  final String? email;

  ///
  final String? password;
}

/// {@template BlocAuthLogoutEvent}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthLogoutEvent extends BlocAuthEvent {}

/// {@template BlocAuthLoginWithGoogleEvent}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthLoginWithGoogleEvent extends BlocAuthEvent {}

/// {@template BlocAuthChangedEvent}
/// TODO: Add description.
/// {@endtemplate}
@immutable
class BlocAuthChangedEvent extends BlocAuthEvent {
  /// {@macro BlocAuthChangedEvent}
  const BlocAuthChangedEvent(this.user);
  final User? user;
}
