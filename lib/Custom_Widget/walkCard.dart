import 'package:flutter/material.dart';

class walkCard extends StatelessWidget {
  final String cityname;
  final int number_OF_members;
  final String organizer_name;
  final String meetingName;
  final String imagename;
  const walkCard({
    Key? key,
    required this.cityname,
    required this.number_OF_members,
    required this.organizer_name,
    required this.meetingName,
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 7),
                  child: Text(
                    meetingName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
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
                    const Icon(Icons.location_on_outlined),
                    const SizedBox(width: 10),
                    Text(
                      cityname,
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
                    const Icon(Icons.people),
                    const SizedBox(width: 7),
                    Text(
                      '$number_OF_members members',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 0),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 10),
                    const Text(
                      'organized by',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      organizer_name,
                      style: const TextStyle(color: Color(0xFF00B7B7)),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
