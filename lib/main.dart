import 'package:flutter/material.dart';
import 'package:linkedin_clone_ui/pages/onBoarding/onBoarding_screen.dart';
import 'package:linkedin_clone_ui/pages/splash/splash.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LinkedIn', 
      home: SplashScreen(
        child: OnBoardingScreen()),
    );
  }
}
