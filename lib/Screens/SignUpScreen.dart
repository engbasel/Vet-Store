import 'package:animlaowner/Screens/LoginSCreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//
import '../Custom_Widget/coustomUI.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isLoading = false;

  final GlobalKey<FormState> _Key = GlobalKey();
  final TextEditingController _controllerusername = TextEditingController();
  final TextEditingController _controllerpassword = TextEditingController();
  final TextEditingController _controllerEmali = TextEditingController();
  final TextEditingController _CityName = TextEditingController();
  TextEditingController animaltype = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  bool _isObscured = true;
  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF293462),
        body: SingleChildScrollView(
          child: Form(
            key: _Key,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomTopUI(),
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
                //                               user name
                // ----------------------------------------------------------------------------
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color to white
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
                      // autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        controller: _controllerusername,
                        // validator: (value) {
                        //   if (value!.length == 0) {
                        //     return 'required field';
                        //   } else if (value!.length < 3) {
                        //     return 'Enter Your Full name please ';
                        //   }
                        // },
                        decoration: const InputDecoration(
                          hintText: 'Enter your name',
                          contentPadding: EdgeInsets.only(
                            left: 4,
                            right: 4,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // ----------------------------------------------------------------------------
                //                                user name
                // ----------------------------------------------------------------------------

                // ----------------------------------------------------------------------------
                //                                _phonenumber
                // ----------------------------------------------------------------------------
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color to white
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
                        keyboardType: TextInputType.phone,
                        controller: _phonenumber,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required field';
                          } else if (value.length < 11) {
                            return 'phone number  ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'phone number',
                          contentPadding: EdgeInsets.all(16.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // ----------------------------------------------------------------------------
                //                                _phonenumber
                // ------------------------------------------------------

                // ----------------------------------------------------------------------------
                //                                CityNAme
                // ----------------------------------------------------------------------------
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color to white
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
                        controller: _CityName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required field';
                          } else if (value.length < 3) {
                            return 'Enter correct city ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'City Name',
                          contentPadding: EdgeInsets.all(16.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // ----------------------------------------------------------------------------
                //                                Cityname
                // ----------------------------------------------------------------------------

                // ----------------------------------------------------------------------------
                //                                animal type
                // ----------------------------------------------------------------------------
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color to white
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
                        controller: animaltype,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required field';
                          } else if (value.length < 3) {
                            return 'correct animal type  ';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'animal type',
                          contentPadding: EdgeInsets.all(16.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // ----------------------------------------------------------------------------
                //                                animal type
                // ----------------------------------------------------------------------------

                // ----------------------------------------------------------------------------
                //                                Email
                // ----------------------------------------------------------------------------
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Set the background color to white
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
                        keyboardType: TextInputType.emailAddress,
                        controller: _controllerEmali,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'required field';
                          } else if (value.length < 3) {
                            return 'Enter corect email ';
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
                //                                Email
                // ----------------------------------------------------------------------------
                // ----------------------------------------------------------------------------
                //                                password
                // ----------------------------------------------------------------------------
                const SizedBox(height: 25),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                // ----------------------------------------------------------------------------
                //                                sign up bottom
                // ----------------------------------------------------------------------------
                const SizedBox(height: 25),

                GestureDetector(
                  onTap: _isLoading
                      ? null // Disable tap when loading
                      : () async {
                          if (_Key.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });

                            try {
                              final newUser = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: _controllerEmali.text,
                                      password: _controllerpassword.text);

                              await FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(newUser.user!.uid)
                                  .set({
                                'email': _controllerEmali.text,
                                'username': _controllerusername.text,
                                'cityname': _CityName.text,
                                'phonenumber': _phonenumber.text,
                                'animaltype': animaltype.text,
                                'password': _controllerpassword.text,
                              });

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                    animaltype: animaltype.text,
                                    city: _CityName.text,
                                    username: _controllerusername.text,
                                    phone: _phonenumber.text,
                                  ),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              }
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      decoration: BoxDecoration(
                        color: _isLoading ? Colors.blueGrey : Color(0xFF00818A),
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
                        child: _isLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                'Signup',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: () async {
                //     GestureDetector(
                //       onTap: _isLoading
                //           ? null // Disable tap when loading
                //           : () async {
                //               if (_Key.currentState!.validate()) {
                //                 setState(() {
                //                   _isLoading = true;
                //                 });

                //                 try {
                //                   final newUser = await FirebaseAuth.instance
                //                       .createUserWithEmailAndPassword(
                //                           email: _controllerEmali.text,
                //                           password: _controllerpassword.text);

                //                   await FirebaseFirestore.instance
                //                       .collection('users')
                //                       .doc(newUser.user!.uid)
                //                       .set({
                //                     'email': _controllerEmali.text,
                //                     'username': _controllerusername.text,
                //                     'cityname': _CityName.text,
                //                     'phonenumber': _phonenumber.text,
                //                     'animaltype': animaltype.text,
                //                     'password': _controllerpassword.text,
                //                   });

                //                   Navigator.of(context).push(
                //                     MaterialPageRoute(
                //                       builder: (context) => LoginScreen(
                //                         animaltype: animaltype.text,
                //                         city: _CityName.text,
                //                         username: _controllerusername.text,
                //                         phone: _phonenumber.text,
                //                       ),
                //                     ),
                //                   );
                //                 } on FirebaseAuthException catch (e) {
                //                   if (e.code == 'weak-password') {
                //                     print('The password provided is too weak.');
                //                   } else if (e.code == 'email-already-in-use') {
                //                     print(
                //                         'The account already exists for that email.');
                //                   }
                //                 } catch (e) {
                //                   print(e);
                //                 } finally {
                //                   setState(() {
                //                     _isLoading = false;
                //                   });
                //                 }
                //               }
                //             },
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 20),
                //         child: Container(
                //           width: double.infinity,
                //           padding: const EdgeInsets.symmetric(
                //               vertical: 16, horizontal: 20),
                //           decoration: BoxDecoration(
                //             color: Color(0xFF00818A),
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.black.withOpacity(0.2),
                //                 blurRadius: 10,
                //                 offset: const Offset(0, 2),
                //               ),
                //             ],
                //           ),
                //           child: Center(
                //             child: _isLoading
                //                 ? CircularProgressIndicator(
                //                     valueColor: AlwaysStoppedAnimation<Color>(
                //                         Colors.white),
                //                   )
                //                 : Text(
                //                     'Signup',
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 18,
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //           ),
                //         ),
                //       ),
                //     );
                //     setState(() {
                //       _isLoading = true;
                //     });
                //     await Future.delayed(const Duration(seconds: 2));
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => LoginScreen(),
                //       ),
                //     );
                //     setState(() {
                //       _isLoading = false;
                //     });
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 20),
                //     child: Container(
                //       width: double.infinity,
                //       padding: const EdgeInsets.symmetric(
                //           vertical: 16, horizontal: 20),
                //       decoration: BoxDecoration(
                //         color: Colors.blueGrey, // Background color
                //         borderRadius: BorderRadius.circular(10),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black.withOpacity(0.2),
                //             blurRadius: 10,
                //             offset: const Offset(0, 2),
                //           ),
                //         ],
                //       ),
                //       child: Center(
                //         child: _isLoading
                //             ? const CircularProgressIndicator(
                //                 valueColor:
                //                     AlwaysStoppedAnimation<Color>(Colors.white),
                //               )
                //             : const Text(
                //                 'Signup',
                //                 style: TextStyle(
                //                   color: Colors.white, // Text color
                //                   fontSize: 18,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //       ),
                //     ),
                //   ),
                // )

                // ----------------------------------------------------------------------------
                //                                sign up bottom
                // ----------------------------------------------------------------------------
                // ----------------------------------------------------------------------------
                //                                already have an account
                // ----------------------------------------------------------------------------

                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'already have an account',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // ----------------------------------------------------------------------------
                //                                already have an account
                // ----------------------------------------------------------------------------
                const CustomBottomUI(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
