// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task_app/services/auth_firebase_services.dart';
import 'package:meta/meta.dart';

part 'bloc_auth_event.dart';
part 'bloc_auth_state.dart';

/// {@template BlocAuth}
/// TODO: Add description.
/// {@endtemplate}
class BlocAuth extends Bloc<BlocAuthEvent, BlocAuthState> {
  /// {@macro BlocAuth}
  BlocAuth() : super(const BlocAuthStateInitial()) {
    final currentUser = _auth.currentUser;

    _auth.authStateChanges().listen((User? user) {
      add(BlocAuthChangedEvent(user));
    });
    if (currentUser != null) {
      emit(BlocAuthStateAuthenticated.from(state));
    } else {
      emit(BlocAuthStateUnauthenticated.from(state));
    }

    on<BlocAuthChangedEvent>(_onAuthStateChanged);

    on<BlocAuthLoginWithGoogleEvent>(_onLoginWithGoogle);

    on<BlocAuthLoginWithCredentialsEvent>(_onLoginWithCredentials);

    on<BlocAuthLogoutEvent>(_onSignOut);

    on<BlocAuthRegisterWithCredentialsEvent>(_onRegisterWithCredentials);
  }

  final _auth = FirebaseAuth.instance;

  final authService = AuthService();

  ///
  Future<void> _onAuthStateChanged(
    BlocAuthChangedEvent event,
    Emitter<BlocAuthState> emit,
  ) async {
    if (event.user != null) {
      emit(BlocAuthStateAuthenticated.from(state));
    } else {
      emit(BlocAuthStateUnauthenticated.from(state));
    }
  }

  ///
  Future<void> _onLoginWithGoogle(
    BlocAuthLoginWithGoogleEvent event,
    Emitter<BlocAuthState> emit,
  ) async {
    try {
      emit(BlocAuthStateLoading.from(state));
      final user = await authService.signInWithGoogle();
      user == null
          ? emit(BlocAuthStateFailedToLogin.from(state))
          : emit(BlocAuthStateLoged.from(state));
    } catch (e) {
      emit(BlocAuthStateFailedToLogin.from(state));
    }
  }

  ///
  Future<void> _onLoginWithCredentials(
    BlocAuthLoginWithCredentialsEvent event,
    Emitter<BlocAuthState> emit,
  ) async {
    try {
      emit(BlocAuthStateLoading.from(state));
      final user = await authService.signInWithEmailPassword(
        event.email ?? '',
        event.password ?? '',
      );
      user == null
          ? emit(BlocAuthStateFailedToLogin.from(state))
          : emit(BlocAuthStateLoged.from(state));
    } catch (e) {
      emit(BlocAuthStateFailedToLogin.from(state));
    }
  }

  ///
  Future<void> _onRegisterWithCredentials(
    BlocAuthRegisterWithCredentialsEvent event,
    Emitter<BlocAuthState> emit,
  ) async {
    try {
      emit(BlocAuthStateLoading.from(state));
      final user = await authService.registerWithEmailPassword(
        event.email ?? '',
        event.password ?? '',
      );
      user == null
          ? emit(BlocAuthStateFailedToLogin.from(state))
          : emit(BlocAuthStateLoged.from(state));
    } catch (e) {
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        return emit(BlocAuthStateFailedToRegisterAlreadyUse.from(state));
      }
      emit(BlocAuthStateFailedToLogin.from(state));
    }
  }

  ///
  Future<void> _onSignOut(
    BlocAuthLogoutEvent event,
    Emitter<BlocAuthState> emit,
  ) async {
    try {
      emit(BlocAuthStateLoading.from(state));
      await authService.signOut();
      emit(BlocAuthStateUnauthenticated.from(state));
    } catch (e) {
      emit(BlocAuthStateUnauthenticated.from(state));
    }
  }
}
