import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template FirebaseServices}
/// TODO: Add description.
/// {@endtemplate}
class FirebaseServices {
  ///
  User? get _currentUser => auth.currentUser;

  ///
  FirebaseAuth get auth => FirebaseAuth.instance;

  ///
  GoogleSignIn get googleSignIn => GoogleSignIn();

  ///
  User get currentUser =>
      _currentUser != null ? _currentUser! : throw Exception('User not found');
}
