import 'package:flutter/material.dart';
import 'package:todo_app/imp/button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 150,
        child: Column(
          
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            

            //user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "add a new text",
              ),
              
            ),

            //buttons - save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                //save button
                MyButton(text: "Save", onPressed: onSave),

                const SizedBox(width: 15,),

                //cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}