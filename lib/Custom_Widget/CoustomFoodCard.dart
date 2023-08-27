import 'package:animlaowner/Screens/paymentScreen.dart';
import 'package:flutter/material.dart';

class CustomFoodCard extends StatelessWidget {
  final String type;
  final int expaire;
  final String factory;
  final String imagename;
  const CustomFoodCard({
    Key? key,
    required this.type,
    required this.expaire,
    required this.factory,
    required this.imagename,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  imagename,
                  width: 250,
                ),
              ],
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10, left: 7),
                  //   child: Text(
                  //     '${meetingName}',
                  //     style:
                  //         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //   ),
                  // )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Icon(Icons.location_on_outlined),
                      const SizedBox(width: 10),
                      Text(
                        ' $type',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      // Icon(Icons.people),
                      const SizedBox(width: 7),
                      Text(
                        'pepole buy it $expaire person',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5, top: 5, left: 5, right: 0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 10),
                        const Text(
                          'imported by',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          factory,
                          style: const TextStyle(color: Color(0xFF00B7B7)),
                        ),
                        // SizedBox(width: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            // vertical: 20,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    blurRadius: 10, // Spread of the shadow
                                    offset: const Offset(
                                        0, 2), // Offset of the shadow
                                  ),
                                ],
                              ),
                              child: const Center(
                                  child: Text(
                                'Buy',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
