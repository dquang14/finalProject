import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//button login
class MyButton extends StatelessWidget{
  final String buttonText;
  const MyButton({
    super.key,
    required this.buttonText
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(
              255, 255, 255, 1.0
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}