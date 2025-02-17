part of 'bloc_auth.dart';

/// {@template BlocAuthState}
/// TODO: Add description.
/// {@endtemplate}
@immutable
sealed class BlocAuthState extends Equatable {
  /// {@macro BlocAuthState}
  const BlocAuthState._();

  const BlocAuthState.from(
    BlocAuthState state,
  ) : this._();

  @override
  List<Object> get props => [];
}

/// {@template BlocAuthStateInitial}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthStateInitial extends BlocAuthState {
  /// {@macro BlocAuthStateInitial}
  const BlocAuthStateInitial() : super._();
}

/// {@template BlocAuthStateLoading}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthStateLoading extends BlocAuthState {
  /// {@macro BlocAuthStateLoading}
  const BlocAuthStateLoading.from(super.state) : super.from();
}

/// {@template BlocAuthStateLoged}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthStateLoged extends BlocAuthState {
  /// {@macro BlocAuthStateLoged}
  const BlocAuthStateLoged.from(super.state) : super.from();
}

/// {@template BlocAuthStateFailedToLogin}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthStateFailedToLogin extends BlocAuthState {
  /// {@macro BlocAuthStateFailedToLogin}
  const BlocAuthStateFailedToLogin.from(super.state) : super.from();
}

/// {@template BlocAuthStateFailedToRegisterAlreadyUse}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthStateFailedToRegisterAlreadyUse extends BlocAuthState {
  /// {@macro BlocAuthStateFailedToRegisterAlreadyUse}
  const BlocAuthStateFailedToRegisterAlreadyUse.from(super.state)
      : super.from();
}

/// {@template BlocAuthStateAuthenticated}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthStateAuthenticated extends BlocAuthState {
  /// {@macro BlocAuthStateAuthenticated}
  const BlocAuthStateAuthenticated.from(super.state) : super.from();
}

/// {@template BlocAuthStateUnauthenticated}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuthStateUnauthenticated extends BlocAuthState {
  /// {@macro BlocAuthStateUnauthenticated}
  const BlocAuthStateUnauthenticated.from(super.state) : super.from();
}
