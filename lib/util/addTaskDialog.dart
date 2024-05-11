import 'package:flutter/material.dart';
import 'package:to_do_list/util/button.dart';

class newTaskDialog extends StatelessWidget {
  final controller;
  final String hintText;

  VoidCallback onSave;
  VoidCallback onCancel;
  
  // controller is used in constructor because we want to access the controller in homepage too
  newTaskDialog({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 227, 240, 221),
      content: Container (
        height: 120,
        decoration: BoxDecoration (
          borderRadius: BorderRadius.circular(0.0),
          ),
        child: Column (children: [
          //Get user input
          TextField(
            controller: controller,
            decoration: InputDecoration (
              border: OutlineInputBorder (),
              hintText: hintText,
            ),
          ),

        // save and cancel button
        Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          // Save button
          MyButton(buttonText: "Save", onPressed: onSave),

          //Cancel Button
          MyButton(buttonText: "Cancel", onPressed: onCancel)
        ])
        ],),
        ),
      
    );
  }
}