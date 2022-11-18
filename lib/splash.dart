import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(const Splash());
}

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  // ignore: library_private_types_in_public_api
  State<Splash> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Lottie.asset('assets/lottie.json',
            controller: _controller,
            height: MediaQuery.of(context).size.height * 1,
            animate: true, onLoaded: (composition) {
      _controller
        ..duration = composition.duration
        ..forward().whenComplete(
            () => FirebaseAuth.instanceFor(app: Firebase.app("my app")).authStateChanges().listen((User? user) {
                  if (user == null) {
                    Navigator.pushNamed(context, '/login');
                  } else {
                    Navigator.pushNamed(context, '/home');
                  }
                }));
    }));
  }
}
