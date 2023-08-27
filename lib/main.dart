import 'package:animlaowner/Screens/Home_Screen.dart';
import 'package:animlaowner/Screens/paymentScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/CatoigryScreen.dart';
import 'Screens/Dogprofile.dart';
import 'Screens/LoginSCreen.dart';
import 'Screens/SignUpScreen.dart';
import 'Screens/mainScreen.dart';
import 'Screens/userProfile.dart';
import 'firebase_options.dart';
// import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Vet_Clinic());
}

class Vet_Clinic extends StatelessWidget {
  const Vet_Clinic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      routes: {
        'CatoigryScreen': (context) => const CatoigryScreen(),
        'Home_Screen': (context) => const HomeScreen(),
        'loginScreen': (context) => LoginScreen(),
        'SignUpScreen': (context) => const SignUpScreen(),
        'Dogproflie': (context) => const Dogproflie(),
        'Userprofile': (context) => const Userprofile(),
        'MainScreen': (context) => const MainScreen(),
        'CheckoutScreen': (context) => const CheckoutScreen(),
      },
    );
  }
}
