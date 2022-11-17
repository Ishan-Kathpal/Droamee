import 'package:droame/pages/forgot.dart';
import 'package:droame/pages/login.dart';
import 'package:droame/pages/phone.dart';
import 'package:droame/pages/register.dart';
import 'package:droame/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async {
  await dotenv.load(fileName: "assets/.env");
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        '/splash': (context) =>const Splash(),
        '/login':(context) => const Login(),
        '/register':(context) => const Register(),
        '/forgot':(context) => const Forgot(),
        '/phone':(context) => const Phone(),
      },
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      title: 'Dear Me',
      home: const Splash(),
    );
  }
}
