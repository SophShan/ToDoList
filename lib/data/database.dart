import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/util/listContainer.dart';

class ToDoDatabase {

List toDoList = [];
Map allLists = {};

// reference the hive box
final _myBox = Hive.box("myBox");
final _myList = Hive.box("myList");

// runs this method if its the first time ever opening the app
void createInitialData (){
  toDoList = [
    ["Download To Do App", true]
  ];

  // {"TASKLISTNAME": [ [ ["TASKNAME1", TASK1COMPLETEBOOL],  ["TASKNAME2", TASK2COMPLETEBOOL]], LISTCOMPLETEBOOL ]};
  allLists = {"Welcome": [ [ ["Tap the + icon to add a new task", false], ["Slide a task to the left and click the bin to delete a task", false], ["Click the check box when you have completed a task", true]], false ]};
}

// Load the data from the database (used every time after the first time app is opened)
void loadData (){

  // hive works like a dictionary
  // her TODOLIST is the key that retrieves the info
  toDoList = _myBox.get("TODOLIST"); 
}

//update the database (used when user changes data)
void updateDatabase (){
  // stores the value toDoList to be retreived with the key TODOLIST
  _myBox.put("TODOLIST", toDoList);

}

}

