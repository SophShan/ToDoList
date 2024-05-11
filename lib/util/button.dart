import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  VoidCallback onPressed; // does not take any parameters or return a value

  // constructor
  MyButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text (buttonText),
      color: Colors.green[200],
    );
  }
}