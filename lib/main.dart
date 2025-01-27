import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_mart/feature/auth/login/view/login_screen.dart';
import 'package:tech_mart/feature/dashboard/view/dashboard.dart';
import 'package:tech_mart/feature/details/view/product_details_screen.dart';
import 'package:tech_mart/feature/home/view/admin/admin_home_screen.dart';
import 'package:tech_mart/feature/home/view/user/user_home_screen.dart';
import 'package:tech_mart/feature/profile/view/edit_info_screen.dart';
import 'package:tech_mart/feature/profile/view/profile_screen.dart';
import 'package:tech_mart/feature/splash/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}