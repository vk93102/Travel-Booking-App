import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../host_onboarding_screen/host_onboarding_screen.dart';
import '../login_screen/login_screen.dart';

class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.data != null) {
          return HostOnboardingScreen();
        }

        return const LoginScreen();
      },
    );
  }
}
