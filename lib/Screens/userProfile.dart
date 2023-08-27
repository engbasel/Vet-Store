import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  var username;
  var phone;
  var email;
  var animaltype;
  var cityname;

  @override
  void initState() {
    super.initState();
    getprefs(); // Call the getprefs() method when the widget initializes
  }

  getprefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username');
      phone = preferences.getString('phone');
      animaltype = preferences.getString('animaltype');
      cityname = preferences.getString('cityname');
      email = preferences.getString('email');
      // username = preferences.getString('username');
      // username = preferences.getString('username');
    });

    print('===========================================');
    print(username);
    print('===========================================');

    print('===========================================');
    print(phone);
    print('===========================================');

    print('===========================================');
    print(cityname);
    print('===========================================');

    print('===========================================');
    print(email);
    print('===========================================');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          // appBar: AppBar(),
          backgroundColor: const Color(0xFF293462),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 210,
                decoration: const BoxDecoration(color: Color(0xFF15464E)),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('images/icon2.png'),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        username.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xFFC9E193)),
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 25),
                        // SizedBox(width: 25),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(Icons.email),
                              const SizedBox(
                                width: 50,
                              ),
                              Text(
                                '$email',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 25,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(Icons.phone),
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              '$phone',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(Icons.location_city),
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              '$cityname',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            const Icon(Icons.analytics_outlined),
                            const SizedBox(
                              width: 50,
                            ),
                            Text(
                              '$animaltype',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
