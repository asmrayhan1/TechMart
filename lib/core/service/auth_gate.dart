import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tech_mart/core/service/auth_service.dart';
import 'package:tech_mart/feature/dashboard/view/admin/admin_dashboard.dart';
import 'package:tech_mart/feature/dashboard/view/user/user_dashboard.dart';

import '../../feature/auth/login/view/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // check if there is a valid session currently
          final session = snapshot.hasData? snapshot.data!.session : null;
          if (session != null){
            return (AuthService().getCurrentUserEmail() == "rc295908@gmail.com" ? AdminDashboard() : UserDashboard());
          } else {
            return LoginScreen();
          }
        }
    );
  }
}