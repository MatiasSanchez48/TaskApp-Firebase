import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_task_app/app/app.dart';
import 'package:firebase_task_app/bootstrap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyDqrdNPJa7zLzoLnCeAT5bABK9VVAMfROE',
        authDomain: 'task-app-f1886.firebaseapp.com',
        databaseURL: 'https://task-app-f1886-default-rtdb.firebaseio.com',
        projectId: 'task-app-f1886',
        storageBucket: 'task-app-f1886.firebasestorage.app',
        messagingSenderId: '523128838722',
        appId: '1:523128838722:web:2345251b783981da04abdb',
        measurementId: 'G-YXT8ECPBDT',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  await bootstrap(() => const App());
}
