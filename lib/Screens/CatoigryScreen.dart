import 'package:flutter/material.dart';

import '../Custom_Widget/CoustomAnimalCard.dart';

class CatoigryScreen extends StatefulWidget {
  const CatoigryScreen({super.key});

  @override
  State<CatoigryScreen> createState() => _CatoigryScreenState();
}

class _CatoigryScreenState extends State<CatoigryScreen> {
  Color backgroundColor_key = const Color(0xFFEFF5F4);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor_key,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 25),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Find anything ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'you need for your pets',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print('Vet');
                              },
                              child: const CoustomAnimalCard(
                                Font_Color: Colors.white,
                                BackGround_Color: Color(0xFF1A535C),
                                Label: 'Vet',
                                imageName: 'images/doctor.png',
                                Bottom_Text: 85,
                                Left_Text: 40,
                                bottom_image: 40,
                                Left_image: 70,
                              ),
                            ),
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print('places to eat');
                              },
                              child: const CoustomAnimalCard(
                                hight_image: 190,
                                width_image: 160,
                                Font_Color: Colors.black,
                                BackGround_Color: Color(0xFFC9E193),
                                Label: 'Places to\n\n eat',
                                imageName: 'images/iStock-1184149953.png',
                                Bottom_Text: 65,
                                Left_Text: 10,
                                bottom_image: 20,
                                Left_image: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print('places to wallk');
                              },
                              child: const CoustomAnimalCard(
                                Font_Color: Colors.white,
                                BackGround_Color: Color(0xFF00B7B7),
                                Label: 'Places to \n\n walk',
                                imageName: 'images/icon4.png',
                                Bottom_Text: 70,
                                Left_Text: 30,
                                bottom_image: 23,
                                Left_image: 60,
                                width_image: 170,
                                hight_image: 190,
                              ),
                            ),
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print('Spas Salons ');
                              },
                              child: const CoustomAnimalCard(
                                Font_Color: Colors.black,
                                BackGround_Color: Color(0xFFAAE1E1),
                                Label: 'Spas & \n\n Salons',
                                imageName: 'images/icon2.png',
                                Bottom_Text: 70,
                                Left_Text: 25,
                                bottom_image: 40,
                                Left_image: 65,
                              ),
                            ),
                            const SizedBox(height: 10, width: 10),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print('Shoping');
                              },
                              child: const CoustomAnimalCard(
                                Font_Color: Colors.black,
                                BackGround_Color: Color(0xFFC9E193),
                                Label: 'Shoping',
                                imageName: 'images/icon8.png',
                                Bottom_Text: 90,
                                Left_Text: 18,
                                bottom_image: 38,
                                Left_image: 45,
                                width_image: 150,
                                hight_image: 160,
                              ),
                            ),
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print('Wallk Groubes');
                              },
                              child: const CoustomAnimalCard(
                                Font_Color: Colors.white,
                                BackGround_Color: Color(0xFFB6DDDF),
                                Label: 'Walk  & \n\n Groubs',
                                imageName: 'images/iStock-1066732182.png',
                                Bottom_Text: 70,
                                Left_Text: 18,
                                bottom_image: 43,
                                Left_image: 40,
                                width_image: 180,
                                hight_image: 130,
                              ),
                            ),
                            const SizedBox(height: 10, width: 10),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print(
                                  'Animals in nadoption',
                                );
                              },
                              child: const CoustomAnimalCard(
                                Font_Color: Colors.black,
                                BackGround_Color: Color(0xFF00B7B7),
                                Label: 'Animals in\n\nadoption',
                                imageName: 'images/icon3.png',
                                Bottom_Text: 70,
                                Left_Text: 15,
                                bottom_image: 14,
                                Left_image: 35,
                                width_image: 190,
                                hight_image: 210,
                              ),
                            ),
                            const SizedBox(height: 10, width: 10),
                            GestureDetector(
                              onTap: () {
                                print('Dogs');
                              },
                              child: const CoustomAnimalCard(
                                Font_Color: Colors.white,
                                BackGround_Color: Color(0xFF00B7B7),
                                Label: 'Dogs',
                                imageName: 'images/icon6.png',
                                Bottom_Text: 85,
                                Left_Text: 20,
                                bottom_image: 40,
                                Left_image: 50,
                              ),
                            ),
                            const SizedBox(height: 10, width: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
