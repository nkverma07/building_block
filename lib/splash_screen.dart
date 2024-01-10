import 'dart:async';
import 'package:building_block/my_default_screen.dart';
import 'package:flutter/material.dart';

class StartSplashScreen extends StatelessWidget {
  const StartSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: SplashScreen(),);
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyDefaultScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            'Welcome',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
