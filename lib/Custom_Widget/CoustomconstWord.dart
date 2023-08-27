// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class COustmCard extends StatelessWidget {
  const COustmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 350,
          height: 83,
          decoration: BoxDecoration(
            color: const Color(0xFF00B7B7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 60, bottom: 10),
                child: Text(
                  'Lola is lost in your neighborhood!',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 60, bottom: 20),
                child: Text(
                  'Help us find her!',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Image.asset('images/icon1.png'),
      ],
    );
  }
}
