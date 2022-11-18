import 'package:droame/pages/forgot.dart';
import 'package:droame/pages/home.dart';
import 'package:droame/pages/login.dart';
import 'package:droame/pages/phone.dart';
import 'package:droame/pages/register.dart';
import 'package:droame/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "my app",
      options: const FirebaseOptions(
          apiKey: "AIzaSyAykxUlSvoTUYkSP6Rk2mDGfzxvNTBSqqM",
          appId: "1:773510038696:web:50e8862f0682527568ee9d",
          messagingSenderId: "773510038696",
          projectId: "droame-2f925",
          authDomain: "droame-2f925.firebaseapp.com",
          storageBucket: "droame-2f925.appspot.com"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/splash': (context) => const Splash(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/forgot': (context) => const Forgot(),
        '/phone': (context) => const Phone(),
        '/home': (context) => const Home(),
      },
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      title: 'Dear Me',
      home: const Splash(),
    );
  }
}
