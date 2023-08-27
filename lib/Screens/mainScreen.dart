import 'package:animlaowner/Custom_Widget/Loginbutton.dart';
import 'package:animlaowner/Custom_Widget/SignupButton.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 210, 218, 216),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('images/icon1.png'),
              ),
              SizedBox(height: 25),
              LoginButton(),
              SizedBox(height: 50),
              SignupButton()
            ],
          ),
        ),
      ),
    );
  }
}
