import 'package:flutter/material.dart';

class Addtaskdialoge extends StatelessWidget{

  final VoidCallback onSave;
  final VoidCallback onCancel;
  final TextEditingController controller;

  Addtaskdialoge({super.key, required this.onSave, required this.onCancel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [
            TextField(

              decoration: InputDecoration(
                hintText: 'Enter your task',
                border: OutlineInputBorder()
              ),

              controller: this.controller,
                
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(onPressed: this.onSave, color: Colors.amber, child: Text("Save"),),
                MaterialButton(onPressed: this.onCancel, color: Colors.amber, child: Text("Cancel"),)
              ],
            ),

        ],),
      ),
    );
  }
}