import 'package:flutter/material.dart';

class Dogproflie extends StatefulWidget {
  const Dogproflie({super.key});

  @override
  State<Dogproflie> createState() => _DogproflieState();
}

class _DogproflieState extends State<Dogproflie> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFEFF5F4),
            body: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Dog profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          // right: 5,
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/dogprofile.png',
                              // width: 400,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/dogprofile.png',
                              // width: 400,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'images/dogprofile.png',
                              // width: 400,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                  // width: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width: 15),
                      Text(
                        'Betrx',
                        style: TextStyle(fontSize: 30),
                      ),
                      Icon(
                        Icons.ios_share,
                        size: 30,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Waight',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '3.5 KG',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Age',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '9 Monthes',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Hometown',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Chicago',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        Text(
                          'About Baxter',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        Text(
                          '''
Domestic dogs are mostly kept as pets, though many
breeds are ca pable of surviving on their own,
whether it's in a forest or on city streets.
''',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
