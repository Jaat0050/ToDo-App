import 'package:flutter/material.dart';
import 'package:todo_app/data/constant.dart';
import 'package:todo_app/common_widgets/button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //user input
            TextField(
              controller: controller,
              maxLines: 3,
              cursorColor: appMainColor,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(color: appMainColor)),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appMainColor)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appMainColor)),
                disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: appMainColor)),
                labelText: "Add a new task...",
                alignLabelWithHint: true,
                labelStyle: TextStyle(color: appMainColor),
              ),
            ),

            //buttons - save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onSave,
                  child: Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(color: appMainColor, borderRadius: BorderRadius.circular(4)),
                    child: Center(child: Text("Save", style: TextStyle(color: Colors.white))),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: onCancel,
                  child: Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(color: appMainColor, borderRadius: BorderRadius.circular(4)),
                    child: Center(child: Text("Cancel", style: TextStyle(color: Colors.white))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
