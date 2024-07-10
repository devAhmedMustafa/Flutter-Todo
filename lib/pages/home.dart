import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/ToDoListDB.dart';
import 'package:flutter_application_1/utils/AddTaskDialoge.dart';
import 'package:flutter_application_1/utils/TodoTile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final box = Hive.box("mybox");
  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (box.get("TODOLIST") == null){
      db.initializeList();
    }
    else{
      db.loadData();
    }

    super.initState();
  }

  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.ToDoList[index]['isDone'] = value!;
    });
    db.updateDatabase();
  }

  void saveTask(){
    setState(() {
      db.ToDoList.add({ 
        'title': _controller.text,
        'isDone': false,
      });
    }
    );
    _controller.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteTask(int index){

    setState(() {
      db.ToDoList.removeAt(index);
    });

    db.updateDatabase();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Center(child:Text("TO DO"))
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
              context: context,
              builder: (context) {
                return Addtaskdialoge(
                onSave: saveTask,
                onCancel: ()=> Navigator.of(context).pop(),
                controller: _controller
                );
              });
          },
          backgroundColor: Colors.yellow,
          child: Icon(Icons.add),
        ),

        body: ListView.builder(itemCount: db.ToDoList.length, itemBuilder: (context, i){
          return Todotile(title: db.ToDoList[i]['title'], 
          isDone: db.ToDoList[i]['isDone'],
          deleteTask: (context) => deleteTask(i),
          onChanged: (value) => checkBoxChanged(value, i));
        },)

      );
  }
}