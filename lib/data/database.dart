import 'package:hive_flutter/hive_flutter.dart';

class ToDodatabase{

  List todolist = [];

  // reference our box
  final _myBox = Hive.box('myBox');

  //need 3 methods

  //1. first time opening the app
  void createInitialdata(){
    todolist = [
      ["Welcome", false],
    ];
  }

  //2. load datafrom database
  void loadData(){
    todolist = _myBox.get("TODO");
  }

  //3. update the database
  void updateDatabase(){
    _myBox.put("TODO", todolist);
  }
}