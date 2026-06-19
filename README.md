# flutter_tracker_app

# SafeHer - Emergency Safety Application

## Overview

SafeHer is a Flutter-based emergency safety application designed to help users quickly alert trusted contacts during emergency situations. The application provides secure user authentication, profile management, emergency contact registration, live location sharing, and SOS alert functionality.

The primary goal of SafeHer is to improve personal safety by enabling users to send their current location to emergency contacts with a single tap.

---

## Features

### 1. User Authentication

* Firebase Authentication integration
* Secure user registration
* User login functionality
* Persistent login session
* Logout functionality

### 2. User Profile Management

Users can create and manage their profile information:

* Full Name
* Phone Number
* Emergency Contact 1
* Emergency Contact 2
* Emergency Contact 3

All profile information is stored securely in Cloud Firestore.

### 3. Emergency Contact Registration

Users can register up to three emergency contacts.

These contacts are stored in Firebase Firestore and can be used during emergency situations.

### 4. SOS Emergency Alert

The SOS button is the core feature of the application.

When the user presses the SOS button:

1. Current location is obtained using GPS.
2. A Google Maps location link is generated.
3. Emergency alert message is created.
4. WhatsApp opens automatically with the emergency message.
5. User can instantly send the alert to emergency contacts.

Example Message:

🚨 SOS ALERT!

I may be in danger.

My Location:
https://maps.google.com/?q=latitude,longitude

### 5. Live Location Sharing

The application uses the Geolocator package to:

* Access device GPS
* Retrieve current latitude and longitude
* Generate Google Maps location links

### 6. Modern User Interface

* Professional splash screen
* Responsive Flutter UI
* Modern safety-focused design
* Easy navigation

---

## Technologies Used

### Frontend

* Flutter
* Dart

### Backend

* Firebase Authentication
* Cloud Firestore

### Packages Used

* firebase_core
* firebase_auth
* cloud_firestore
* geolocator
* url_launcher
* google_fonts

---

## Project Structure

lib/

├── screens/

│ ├── splash_screen.dart

│ ├── login_screen.dart

│ ├── profile_setup_screen.dart

│ ├── main_navigation_screen.dart

│

├── widgets/

│ ├── sos_button.dart

│

├── services/

│

├── firebase_options.dart

│

└── main.dart

---

## Working Flow

### Step 1: User Registration

* User creates an account using Firebase Authentication.
* Profile information is saved to Firestore.

### Step 2: Login

* User logs in.
* Firebase maintains the login session.

### Step 3: Profile Setup

User enters:

* Name
* Phone Number
* Emergency Contact 1
* Emergency Contact 2
* Emergency Contact 3

### Step 4: SOS Activation

When the SOS button is pressed:

* Location permission is checked.
* Current GPS coordinates are obtained.
* Google Maps link is generated.
* WhatsApp is opened with the SOS message.

### Step 5: Emergency Response

Emergency contacts receive:

* SOS alert message
* User location link
* Immediate access to the user's current location

---

## Installation

### Clone Repository

git clone https://github.com/V-Ranjith-Kumar/SOS_Emergency.git

### Open Project

cd SOS_Emergency

### Install Dependencies

flutter pub get

### Run Application

flutter run

---

## Build APK

Generate Release APK:

flutter build apk --release

APK Location:

build/app/outputs/flutter-apk/app-release.apk

---

## Future Enhancements

* SOS history storage
* Push notifications
* Real-time location tracking
* Camera integration
* Audio recording during emergencies
* SMS emergency alerts
* Police and hospital contact integration
* Firebase Cloud Messaging support

---

## Developer

Developed by:

Ranjith Kumar

Flutter Developer

---

## Conclusion

SafeHer is a personal safety application that combines Flutter and Firebase technologies to provide a fast and reliable emergency response system. The application helps users quickly share their location with trusted contacts during critical situations, improving personal safety and emergency communication.
