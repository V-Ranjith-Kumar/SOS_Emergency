import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SOSButton extends StatelessWidget {
  const SOSButton({super.key});

  Future<void> sendSOS(BuildContext context) async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please enable location services"),
          ),
        );
        return;
      }

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      Position position = await Geolocator.getCurrentPosition();

      String location =
          "https://maps.google.com/?q=${position.latitude},${position.longitude}";

      final user = FirebaseAuth.instance.currentUser;

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();

      final data = doc.data();

      String contact = data?['contact1'] ?? '';

      String message =
          "🚨 SOS ALERT!\n"
          "I may be in danger.\n\n"
          "My Location:\n$location";

      final whatsappUrl = Uri.parse(
        "https://wa.me/$contact?text=${Uri.encodeComponent(message)}",
      );

      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("SOS Sent")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => sendSOS(context),
      child: Container(
        width: 220,
        height: 220,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.6),
              blurRadius: 50,
              spreadRadius: 15,
            ),
            BoxShadow(
              color: Colors.red.shade900,
              blurRadius: 25,
              offset: const Offset(0, 12),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFF6B6B),
              Color(0xFFE53935),
              Color(0xFFB71C1C),
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFF8A80),
                Color(0xFFD32F2F),
              ],
            ),
            border: Border.all(
              color: Colors.white24,
              width: 3,
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_rounded,
                size: 55,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                "SOS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "HELP ME",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

