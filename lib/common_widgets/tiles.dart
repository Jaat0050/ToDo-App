import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/constant.dart';

// ignore: must_be_immutable
class Tiles extends StatelessWidget {
  final String taskName;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function() deleteFunction;

  Tiles({
    super.key,
    required this.taskName,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.33,
          children: [
            GestureDetector(
              onTap: deleteFunction,
              child: Card(
                elevation: 4,
                margin: EdgeInsets.only(left: 6),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13)),
                  child: Center(child: Image(image: AssetImage(deleteButtonGIF), height: 80, width: size.width * 0.27)),
                ),
              ),
            )
          ],
        ),
        child: Card(
          margin: EdgeInsets.all(0),
          elevation: 4,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      //checkbox
                      Checkbox(value: taskcompleted, onChanged: onChanged, activeColor: appMainColor, shape: const RoundedRectangleBorder()),

                      //task name
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 10, right: 10),
                          child: Text(
                            taskName,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.akshar(
                              decorationColor: appMainColor,
                              textStyle: TextStyle(decoration: taskcompleted ? TextDecoration.lineThrough : TextDecoration.none, fontSize: 20, color: Colors.black, height: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //swipe and arrow row
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_double_arrow_left_sharp, color: Colors.grey.shade500),
                      SizedBox(width: 2),
                      Text("Swipe", style: TextStyle(color: Colors.grey.shade500)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
