import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  var box = Hive.box("mybox");

  List ToDoList = [];

  void initializeList(){
    ToDoList = [
    {
      'title': 'Buy milk',
      'isDone': false,
    },
    {
      'title': 'Build an app',
      'isDone': false,
    },
    ];
  }

  void loadData(){
    ToDoList = box.get("TODOLIST");
  }

  void updateDatabase(){
    box.put("TODOLIST", ToDoList);
  }

}