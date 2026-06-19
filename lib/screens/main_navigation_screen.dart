import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_screen.dart';
import 'login_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData ||
              !snapshot.data!.exists) {
            return const Center(
              child: Text("No profile data found"),
            );
          }

          final data =
              snapshot.data!.data() as Map<String, dynamic>;

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 10),

              const CircleAvatar(
                radius: 45,
                child: Icon(
                  Icons.person,
                  size: 45,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.email),
                title: const Text("Email"),
                subtitle: Text(data['email'] ?? ''),
              ),

              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone"),
                subtitle: Text(data['phone'] ?? ''),
              ),

              ListTile(
                leading: const Icon(Icons.badge),
                title: const Text("Aadhaar"),
                subtitle: Text(data['aadhaar'] ?? ''),
              ),

              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Address"),
                subtitle: Text(data['address'] ?? ''),
              ),

              ListTile(
                leading: const Icon(Icons.bloodtype),
                title: const Text("Blood Group"),
                subtitle: Text(data['bloodGroup'] ?? ''),
              ),

              const Divider(),

              const Text(
                "Emergency Contacts",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ListTile(
                title: const Text("Contact 1"),
                subtitle: Text(
                  "${data['relation1']} - ${data['contact1']}",
                ),
              ),

              ListTile(
                title: const Text("Contact 2"),
                subtitle: Text(
                  "${data['relation2']} - ${data['contact2']}",
                ),
              ),

              ListTile(
                title: const Text("Contact 3"),
                subtitle: Text(
                  "${data['relation3']} - ${data['contact3']}",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.logout),
          label: const Text("Logout"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();

            if (context.mounted) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const LoginScreen(),
                ),
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }
}
