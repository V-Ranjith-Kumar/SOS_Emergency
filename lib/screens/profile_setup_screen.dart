import 'package:flutter/material.dart';
import 'main_navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileSetupScreen extends StatefulWidget {
const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
final _formKey = GlobalKey<FormState>();



final phoneController = TextEditingController();
final aadhaarController = TextEditingController();
final addressController = TextEditingController();
final bloodController = TextEditingController();
final Contact_1_Controller = TextEditingController();
final Contact_2_Controller = TextEditingController();
final Contact_3_Controller = TextEditingController();
final Relation_1_Controller = TextEditingController();
final Relation_2_Controller = TextEditingController();
final Relation_3_Controller = TextEditingController();

@override
void dispose() {
    phoneController.dispose();
    aadhaarController.dispose();
    addressController.dispose();
    bloodController.dispose();

    Contact_1_Controller.dispose();
    Contact_2_Controller.dispose();
    Contact_3_Controller.dispose();

    Relation_1_Controller.dispose();
    Relation_2_Controller.dispose();
    Relation_3_Controller.dispose();

    super.dispose();
  }
  

@override
  Widget build(BuildContext context) {

return Scaffold(
  body: Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF0F172A),
          Color(0xFF1E293B),
          Color(0xFF2563EB),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),

    child: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
        child: Column(
          children: [

            const SizedBox(height: 10),

            Stack(
              children: [

                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white12,
                    border: Border.all(
                      color: Colors.white24,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              "Profile Setup",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextFormField(
              controller: phoneController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone,color: Colors.white),
                hintText: "Phone Number",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your phone number';
                }
                return null;
              }
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: aadhaarController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_pin,color: Colors.white),
                hintText: "Aadhaar Number",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your aadhaar number';
                }
                return null;
              }
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: addressController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.home,color: Colors.white),
                hintText: "Address",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your address';
                }
                return null;
              }
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: bloodController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.bloodtype,color: Colors.white),
                hintText: "Blood Group",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter your blood group';
                }
                return null;
              }
            ),

            const SizedBox(height: 35),

            TextFormField(
              controller: Relation_1_Controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.family_restroom,color: Colors.white),
                hintText: "Relation with Contact 1",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the relation with contact 1';
                }
                return null;
              }
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: Contact_1_Controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.contact_phone,color: Colors.white),
                hintText: "Emergency Contact 1",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter emergency contact 1';
                }
                return null;
              }
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: Relation_2_Controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.family_restroom,color: Colors.white),
                hintText: "Relation with Contact 2",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the relation with contact 2';
                }
                return null;
              }
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: Contact_2_Controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.contact_phone,color: Colors.white),
                hintText: "Emergency Contact 2",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter emergency contact 2';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: Relation_3_Controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.family_restroom,color: Colors.white),
                hintText: "Relation with Contact 3",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter the relation with contact 3';
                }
                return null;
              },
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: Contact_3_Controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.contact_phone,color: Colors.white),
                hintText: "Emergency Contact 3",
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.white12,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'please enter emergency contact 3';
                }
                return null;
              },
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            final user = FirebaseAuth.instance.currentUser;

                            await FirebaseFirestore.instance
                                .collection('users')
                                .doc(user!.uid)
                                .set({
                                  'uid': user.uid,
                                  'email': user.email,

                                  'phone': phoneController.text.trim(),
                                  'aadhaar': aadhaarController.text.trim(),
                                  'address': addressController.text.trim(),
                                  'bloodGroup': bloodController.text.trim(),

                                  'contact1': Contact_1_Controller.text.trim(),
                                  'relation1': Relation_1_Controller.text
                                      .trim(),

                                  'contact2': Contact_2_Controller.text.trim(),
                                  'relation2': Relation_2_Controller.text
                                      .trim(),

                                  'contact3': Contact_3_Controller.text.trim(),
                                  'relation3': Relation_3_Controller.text
                                      .trim(),

                                  'createdAt': Timestamp.now(),
                                });

                            if (mounted) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MainNavigationScreen(),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        }
                      },
                child: const Text(
                  "SAVE PROFILE",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
),
);


}
}
