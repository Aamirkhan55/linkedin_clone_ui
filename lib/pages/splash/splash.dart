
import 'package:flutter/material.dart';
import 'package:linkedin_clone_ui/theme/style.dart';


class SplashScreen extends StatefulWidget {
  final Widget child;
  const SplashScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => widget.child),
            (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: linkedInWhiteFFFFFF,
      body: Center(
        child: Image.asset("assets/app_logo.png"),
      ),
    );
  }
} 