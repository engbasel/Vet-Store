import 'package:flutter/material.dart';
import '../Modules/sharedpreferencesModel.dart';
import '../Screens/CatoigryScreen.dart';
import '../Screens/Dogprofile.dart';
import '../Screens/userProfile.dart';

class CoustomDrawer extends StatefulWidget {
  const CoustomDrawer({super.key});

  @override
  State<CoustomDrawer> createState() => _CoustomDrawerState();
}

class _CoustomDrawerState extends State<CoustomDrawer> {
  var username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 25),
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('images/icon2.png'),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 70),
                GestureDetector(
                  onTap: () async {
                    await oldgetprefs();
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Userprofile(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amberAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            TextButton(
                              onPressed: () {
                                oldgetprefs();
                              },
                              child: const Text('My profile'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amberAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.category_outlined),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CatoigryScreen(),
                                  ),
                                );
                              },
                              child: const Text('Catoigry'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.amberAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Dogproflie(),
                                  ),
                                );
                              },
                              child: const Text('Animal profile'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
