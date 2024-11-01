
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 0.5)
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: const Color.fromRGBO(
              1, 1, 1, 0.45), // Màu nền của TextField
          filled: true,
        ),
        style: const TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1.0),
          fontWeight: FontWeight.bold
        ),
        cursorColor: Colors.black,
      ),
    );
  }

}