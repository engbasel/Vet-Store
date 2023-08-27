import 'package:flutter/material.dart';

class CustomTopUI extends StatelessWidget {
  const CustomTopUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 280,
      child: Stack(
        children: [
          Positioned(
            bottom: 60,
            right: 130,
            // left: 20,
            child: Image.asset('images/Top_left2.png'),
          ),
          Positioned(
            bottom: 110,
            right: 130,
            child: Image.asset(
              'images/top_left.png',
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomUI extends StatelessWidget {
  const CustomBottomUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 250,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 40,
            child: Image.asset('images/right_bottom.png'),
          ),
          Positioned(
            top: 140,
            right: 250,
            child: Image.asset(
              'images/left_bottom.png',
            ),
          )
        ],
      ),
    );
  }
}
