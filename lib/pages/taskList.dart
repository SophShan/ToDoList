import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/data/database.dart';
import 'package:to_do_list/util/addTaskDialog.dart';
import 'package:to_do_list/util/toDoTile.dart';
import 'package:to_do_list/util/listContainer.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  // does this first when opening the app
  @override
  void initState() {
    
    //if its the first time opening the app, create default data
    if (_myBox.get("TODOLIST") == null) {// nothing is stored in this key where the list data should be stored
      db.createInitialData();
    }
    else{
      // data already exists
      db.loadData();
    }
    super.initState();
  }

  // reference the hive box
  final _myBox = Hive.box("myBox");
  // create instance of database
  ToDoDatabase db = ToDoDatabase();

  // text controller
  final _controller = TextEditingController();
  
  //see if checkbox tapped
  void checkBoxChanged (bool? value, int index){
    setState(() {
      db.toDoList [index][1] = !db.toDoList[index][1]; // will switch the value to opposite of what it was orginally
      db.updateDatabase();
    });
  }

  // Save new task
  void saveNewTask (){
    setState(() {
      // since variable values are chaging, this code must be in setState
      db.toDoList.add([_controller.text, false]); //uses text controller to get text then adds to list as uncompleted task 
      _controller.clear();
      db.updateDatabase();
    });
    // dismiss the dialog box after the new task is created
    Navigator.of(context).pop();
  }

  // Cancel task, remove dialog box and delete old text
  void cancelNewTask (){
    setState(() {
    _controller.clear(); // remove old text
    });
    Navigator.of(context).pop(); // remove dialog box
  }

  // dialog box to allow user to add a new task
  void createNewTask (){
    showDialog(
      context: context, 
      builder: (context){
        return newTaskDialog(
          controller: _controller,
          onCancel: cancelNewTask,
          onSave: saveNewTask,
          hintText: "Create a New Task",
        );
      });
  }

  // delete a created task
  void deleteTask (int index){
    setState(() {
      db.toDoList.removeAt (index); // removes the specifed task from list
      db.updateDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        elevation: 30,
        title: Center(
          child: Text ("To Do List",),
          ),
      ),
      // to add new task
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Color.fromARGB(255, 153, 195, 153),
        elevation: 5,
        child: Icon (
          Icons.add,
          color: Colors.white,),
      ),
      // list of all the tasks
      body: ListView.builder (
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
            return listContainer(
              listName: "hi",
              deleteTask: (context) => deleteTask(index),
              tasksLeft: 0
              /*taskName: db.toDoList[index][0], // 0 is always the task name in list
              taskComplete: db.toDoList[index][1], 
              onChanged: (value) => checkBoxChanged(value, index), // executes expression to right of => and returns value
              deleteTask: (context) => deleteTask(index), */
              );
        },
      ),
    );
  }
}

