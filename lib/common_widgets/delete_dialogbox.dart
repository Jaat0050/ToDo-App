import 'package:flutter/material.dart';
import 'package:todo_app/data/constant.dart';

// ignore: must_be_immutable
class DeleteDialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  VoidCallback onSave;
  VoidCallback onCancel;
  bool isLogOut;

  DeleteDialogBox({super.key, required this.onSave, required this.onCancel, this.isLogOut = false});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //user input
            isLogOut ? Text("Do you want to Log Out and close the app ?") : Text("Do you want to delete this task ?"),

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
                    child: Center(child: Text("Yes", style: TextStyle(color: Colors.white))),
                  ),
                ),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: onCancel,
                  child: Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(color: appMainColor, borderRadius: BorderRadius.circular(4)),
                    child: Center(child: Text("No", style: TextStyle(color: Colors.white))),
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
