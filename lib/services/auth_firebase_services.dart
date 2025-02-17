import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_task_app/services/services.dart';
import 'package:flutter/foundation.dart';

/// {@template AuthService}
/// TODO: Add description.
/// {@endtemplate}
class AuthService {
  ///
  final _googleSignIn = FirebaseServices().googleSignIn;

  ///
  final _auth = FirebaseServices().auth;

  ///
  Future<User?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print('error to log in: $e');
      }
      return null;
    }
  }

  ///
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print('error to login: $e');
      }
      return null;
    }
  }

  ///
  Future<User?> registerWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      if (kDebugMode) {
        print('error to register: $e');
      }
      if (e is FirebaseAuthException && e.code == 'email-already-in-use') {
        return throw FirebaseAuthException(
          code: 'email-already-in-use',
          message: 'email already in use',
        );
      }
      return null;
    }
  }

  ///
  Future<void> signOut() async {
    if (_auth.currentUser != null) {
      await _googleSignIn.signOut();
      await _auth.signOut();
    }
  }
}
