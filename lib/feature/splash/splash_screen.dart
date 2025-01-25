import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/extensions/image_path.dart';
import '../../shared/containers/custom_image.dart';
import '../auth/login/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f6fb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              width: 250,
              height: 250,
              imagePath: ImagePath.logo,
            ),
          ],
        ),
      ),
    );
  }
}