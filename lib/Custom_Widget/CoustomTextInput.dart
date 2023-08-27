import 'package:flutter/material.dart';

class UserTextField extends StatefulWidget {
  final String Texthint;
  const UserTextField({
    Key? key,
    // required this.username,
    required this.Texthint,
  }) : super(key: key);

  @override
  State<UserTextField> createState() => _UserTextFieldState();
}

class _UserTextFieldState extends State<UserTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
          child: TextFormField(
            decoration: InputDecoration(
              hintText: widget.Texthint,
              contentPadding: const EdgeInsets.all(16.0),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
