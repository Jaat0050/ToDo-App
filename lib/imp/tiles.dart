import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class Tiles extends StatelessWidget {
  final String taskName;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  Tiles({
    super.key,
    required this.taskName,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [

              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    //checkbox
                    Checkbox(
                      value: taskcompleted,
                      onChanged: onChanged,
                      activeColor: Colors.orange,
                      shape: const RoundedRectangleBorder(),
                    ),

                    //task name
                    Text(
                      taskName,
                      style: TextStyle(
                          decoration: taskcompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          fontSize: 20,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),

              //swipe and arrow row
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.keyboard_double_arrow_left_sharp),
                    Text("Swipe")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
