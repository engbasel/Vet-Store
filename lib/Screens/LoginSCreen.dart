import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Custom_Widget/coustomUI.dart';
import 'Home_Screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  bool _isLoading = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  String? username;
  String? city;
  String? animaltype;
  String? phone;
  String? email;
  LoginScreen({
    Key? key,
    this.email,
    this.username,
    this.city,
    this.animaltype,
    this.phone,
  }) : super(key: key);
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  bool _isLoggingIn = false;

  final TextEditingController _controllerusername = TextEditingController();

  final TextEditingController _controllerpassword = TextEditingController();
  final TextEditingController _controllerEmali = TextEditingController();
  final GlobalKey<FormState> _Key = GlobalKey();
  saveprefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('cityname', '${widget.city}');
    preferences.setString('animaltype', '${widget.animaltype}');
    preferences.setString('username', '${widget.username}');
    preferences.setString('password', _controllerpassword.text);
    preferences.setString('phone', '${widget.phone}');
    preferences.setString('email', _controllerEmali.text);
    print('USer name and password saved in local storge');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF293462),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const CustomTopUI(),
                Form(
                  key: _Key,
                  child: Column(
                    children: [
                      // ----------------------------------------------------------------------------
                      //                       CircleAvatar
                      // ----------------------------------------------------------------------------
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/icon1.png'),
                      ),
                      // ----------------------------------------------------------------------------
                      //                       CircleAvatar
                      // ----------------------------------------------------------------------------
                      // ----------------------------------------------------------------------------
                      //                                Email
                      // ----------------------------------------------------------------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors
                                .white, // Set the background color to white
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              controller: _controllerEmali,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'required field';
                                } else if (value.length < 3) {
                                  return 'Enter Your Full name please ';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'inter your Email',
                                contentPadding: EdgeInsets.all(16.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ----------------------------------------------------------------------------
                      //                               Email
                      // ----------------------------------------------------------------------------
                      // ----------------------------------------------------------------------------
                      //                                password
                      // ----------------------------------------------------------------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'password must be at lest 6';
                                }
                                return null;
                              },
                              controller: _controllerpassword,
                              obscureText: _isObscured,
                              decoration: InputDecoration(
                                hintText: 'Enter Your password',
                                contentPadding: const EdgeInsets.all(16.0),
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: _togglePasswordVisibility,
                                  child: Icon(
                                    _isObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ----------------------------------------------------------------------------
                      //                                password
                      // ----------------------------------------------------------------------------
                      const SizedBox(height: 25),
                      // ----------------------------------------------------------------------------
                      //                                Login Bottom
                      // ----------------------------------------------------------------------------

                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            _isLoggingIn = true; // Show progress indicator
                          });

                          if (_Key.currentState!.validate()) {
                            try {
                              await saveprefs();

                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                email: _controllerEmali.text,
                                password: _controllerpassword.text,
                              );

                              print(
                                  'User successfully logged in: ${userCredential.user?.email}');
                              DocumentSnapshot userDataSnapshot =
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .get();
                              Map<String, dynamic> userData = userDataSnapshot
                                  .data() as Map<String, dynamic>;

                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                    username: _controllerusername.text,
                                    userData: userData,
                                  ),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                              // Handle exceptions
                            } finally {
                              setState(() {
                                _isLoggingIn = false; // Hide progress indicator
                              });
                            }
                          }
                        },
                        child: Container(
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey, // Background color
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: _isLoggingIn
                                ? CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ),

                      // ----------------------------------------------------------------------------
                      //                                Login Bottom
                      // ----------------------------------------------------------------------------
                      const SizedBox(height: 15),
                      // ----------------------------------------------------------------------------
                      //                                Forget password
                      // ----------------------------------------------------------------------------
                      GestureDetector(
                        onTap: () {
                          print(
                              '=============Forgot password?====================');
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // ----------------------------------------------------------------------------
                      //                                Forget password
                      // ----------------------------------------------------------------------------
                      const SizedBox(height: 15),
                      // ----------------------------------------------------------------------------
                      //                                Register Her
                      // ----------------------------------------------------------------------------
                      GestureDetector(
                        child: const Text(
                          'Register Here',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          print('============Register Here==========');
                        },
                      ),
                      // ----------------------------------------------------------------------------
                      //                                Register Her
                      // ----------------------------------------------------------------------------
                    ],
                  ),
                ),
                const CustomBottomUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











// bool _isSigningUp = false;

// GestureDetector(
//   onTap: () async {
//     setState(() {
//       _isSigningUp = true; // Show progress indicator
//     });

//     if (_Key.currentState!.validate()) {
//     try {
//                               await saveprefs();

//                               UserCredential userCredential = await FirebaseAuth
//                                   .instance
//                                   .signInWithEmailAndPassword(
//                                 email: _controllerEmali.text,
//                                 password: _controllerpassword.text,
//                               );

//                               print(
//                                   'User successfully logged in: ${userCredential.user?.email}');
//                               DocumentSnapshot userDataSnapshot =
//                                   await FirebaseFirestore.instance
//                                       .collection('users')
//                                       .doc(FirebaseAuth
//                                           .instance.currentUser!.uid)
//                                       .get();
//                               Map<String, dynamic> userData = userDataSnapshot
//                                   .data() as Map<String, dynamic>;

//                               Navigator.of(context).pushReplacement(
//                                 MaterialPageRoute(
//                                   builder: (context) => HomeScreen(
//                                     username: _controllerusername.text,
//                                     userData: userData,
//                                   ),
//                                 ),
//                               );
//                             }  on FirebaseAuthException catch (e) { if (e.code == 'user-not-found') {
//                                 print('No user found for that email.');
//                               } else if (e.code == 'wrong-password') {
//                                 print('Wrong password provided for that user.');
//                               }
//         // Handle exceptions
//       }  finally {
//         setState(() {
//           _isSigningUp = false; // Hide progress indicator
//         });
//       }
//     }
//   },
//   child: Container(
//     width: 300,
//     height: 50,
//     decoration: BoxDecoration(
//       color: const Color(0xFF00818A),
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: Center(
//       child: _isSigningUp
                      // ? CircularProgressIndicator(backgroundColor: Colors.transparent)
//           : Text(
//               'sign up',
//               style: TextStyle(color: Colors.white),
//             ),
//     ),
//   ),
// )

// =========================================================

                      // GestureDetector(
                      //   onTap: () async {
                      //     if (_Key.currentState!.validate()) {
                      //       try {
                      //         await saveprefs();

                      //         UserCredential userCredential = await FirebaseAuth
                      //             .instance
                      //             .signInWithEmailAndPassword(
                      //           email: _controllerEmali.text,
                      //           password: _controllerpassword.text,
                      //         );

                      //         print(
                      //             'User successfully logged in: ${userCredential.user?.email}');
                      //         DocumentSnapshot userDataSnapshot =
                      //             await FirebaseFirestore.instance
                      //                 .collection('users')
                      //                 .doc(FirebaseAuth
                      //                     .instance.currentUser!.uid)
                      //                 .get();
                      //         Map<String, dynamic> userData = userDataSnapshot
                      //             .data() as Map<String, dynamic>;

                      //         Navigator.of(context).pushReplacement(
                      //           MaterialPageRoute(
                      //             builder: (context) => HomeScreen(
                      //               username: _controllerusername.text,
                      //               userData: userData,
                      //             ),
                      //           ),
                      //         );
                      //       } on FirebaseAuthException catch (e) {
                      //         if (e.code == 'user-not-found') {
                      //           print('No user found for that email.');
                      //         } else if (e.code == 'wrong-password') {
                      //           print('Wrong password provided for that user.');
                      //         }
                      //       }
                      //     }
                      //   },
                      //   child: Container(
                      //     width: 300,
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //       color: const Color(0xFF00818A),
                      //       borderRadius: BorderRadius.circular(30),
                      //     ),
                      //     child: const Center(child: Text('Login')),
                      //   ),
                      // ),