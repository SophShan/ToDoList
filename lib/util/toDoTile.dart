import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete; 
  Function (bool?)? onChanged;
  Function (BuildContext?) deleteTask; // hovering over 'onPressed' tells you what parameter types are needed

  

  // had to remove const tag
  // constructor
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChanged,
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
              // CheckBox
              Checkbox(
                value: taskComplete, 
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 132, 181, 133), // change colour of checked box
                ),
        
              // Task Name
              Text (
                taskName,
                style: TextStyle(
                  // if task is complete, text will have strike through else nothing
                  decoration: taskComplete? TextDecoration.lineThrough : TextDecoration.none,
                ),
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