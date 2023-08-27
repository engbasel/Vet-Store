// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CoustomAnimalCard extends StatelessWidget {
  final Color BackGround_Color;
  final Color Font_Color;
  final String imageName;
  final String Label;
  final double Bottom_Text;
  final double Left_Text;
  final double bottom_image;
  final double Left_image;
  final double? hight_image;
  final double? width_image;

  const CoustomAnimalCard({
    Key? key,
    required this.BackGround_Color,
    required this.Font_Color,
    required this.imageName,
    required this.Label,
    required this.Bottom_Text,
    required this.Left_Text,
    required this.bottom_image,
    required this.Left_image,
    this.hight_image,
    this.width_image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // color: Colors.amber,
        color: const Color(0xFFEFF5F4),
      ),
      width: 200,
      height: 200,
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                // color: Colors.red,
                color: BackGround_Color,
                borderRadius: BorderRadius.circular(25),
              ),
              width: 200,
              height: 110,
            ),
          ),
          Positioned(
            left: Left_image,
            bottom: bottom_image,
            child: Image.asset(
              imageName,
              // scale: 1,
              height: hight_image,
              width: width_image,
            ),
          ),
          Positioned(
            bottom: Bottom_Text,
            left: Left_Text,
            child: Text(
              Label,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 15, color: Font_Color),
            ),
          )
        ],
      ),
    );
  }
}



// --------
// 80 image
// 15 image