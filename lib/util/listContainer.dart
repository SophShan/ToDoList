import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class listContainer extends StatelessWidget {
  final String listName;
  //final bool taskComplete; 
  final int tasksLeft;
  Function (BuildContext?) deleteTask; // hovering over 'onPressed' tells you what parameter types are needed

  // constructor
  listContainer({
    super.key,
    required this.listName,
    //required this.taskComplete,
    required this.tasksLeft,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 17),
      child: Slidable (
        endActionPane: ActionPane ( // endActionPane to drag from the right to left
          extentRatio: 0.25,
          motion: DrawerMotion (), // this is a type of transition, can find more in documentation for slidable
          children: [
            SlidableAction(
              onPressed: deleteTask,
            icon: Icons.delete,
            foregroundColor: Colors.white,
            backgroundColor: Colors.red.shade400,
            borderRadius: BorderRadius.circular(15.0),
            ),
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: Row (
            children: [
              
        
              // List Name
              Text (
                listName,
                /*style: TextStyle(
                  // if list is complete, text will have strike through else nothing
                  decoration: taskComplete? TextDecoration.lineThrough : TextDecoration.none,
                ),*/
              ),
                      ]
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 79, 139, 81).withOpacity(0.8),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset (1,2),
              )
            ]
            ),
        ),
      ),
    );
  }
}