import 'package:firebase_auth/firebase_auth.dart';
import 'main_navigation_screen.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
const SplashScreen({super.key});

@override
State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
void initState() {
  super.initState();

  Timer(const Duration(seconds: 3), () {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    }
  });
}


@override
Widget build(BuildContext context) {
return Scaffold(
body: Container(
width: double.infinity,
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [
Color(0xFF0F172A),
Color(0xFF1E293B),
Color(0xFFDC2626),
],
),
),
child: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.12),
              border: Border.all(
                color: Colors.white24,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.health_and_safety_rounded,
              color: Colors.white,
              size: 90,
            ),
          ),

          const SizedBox(height: 30),

          Text(
            "Emergency Safety",
            textAlign: TextAlign.center,
            style: GoogleFonts.orbitron(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "SOS PROTECTION SYSTEM",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white70,
              letterSpacing: 3,
            ),
          ),

          const SizedBox(height: 50),

          const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),

          const SizedBox(height: 15),

          Text(
            "Loading...",
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    ),
  ),
);


}
}
