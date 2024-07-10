import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget{

  final String title;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteTask;

  Todotile({super.key, required this.title, required this.isDone, required this.onChanged, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.only(left:25, right: 25, top: 15),
        child: Slidable(
        
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteTask,
                backgroundColor: Colors.red,
                icon: Icons.delete,
                borderRadius: BorderRadius.circular(12),
                
              ),
        
            ],
          ),
        
          child: Container(
            decoration: BoxDecoration(
              color:Colors.yellow,
              borderRadius: BorderRadius.circular(12)
            ),
            padding: const EdgeInsets.all(20),
            
            child: Row(
              children: [
                Checkbox(value: isDone, onChanged: onChanged, activeColor: Colors.black,),
                Text(this.title, style: TextStyle(
                  decoration: isDone ? TextDecoration.lineThrough : null,
                ),),
              ],
            ),
          ),
        ),
      );
  }
}