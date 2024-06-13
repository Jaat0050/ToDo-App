import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

String toDoListGIF = "images/to-do-list.gif";
String deleteButtonGIF = "images/trash-bin.gif";
String appIcon = "images/playstore.png";

Color appMainColor = Colors.purple.shade800;

void toastMsg(String text) {
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: appMainColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
