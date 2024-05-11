import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/pages/homepage.dart';

void main() async{

// initialize the Hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("myBox"); // can now use myBox to reference the box
  var list = await Hive.openBox("myList"); // to track lists of task
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData (
        appBarTheme: AppBarTheme ( color: Colors.green[200])
      ),
      //theme: ThemeData (primarySwatch: Colors.lightBlue)
    );
  }
} 
