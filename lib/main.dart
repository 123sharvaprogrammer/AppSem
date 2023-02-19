import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/pages/auth_gate.dart';
import 'package:untitled1/pages/firstSight.dart';
import 'package:untitled1/pages/homeScreen.dart';
import 'package:characters/characters.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();

// Ideal time to initialize
//   await FirebaseAuth.instance.useAuthEmulator('localhost', 8000);
//...
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return MaterialApp(home: AuthGate());}
}
