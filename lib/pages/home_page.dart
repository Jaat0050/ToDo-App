import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/imp/dialogbox.dart';

import '../imp/tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference the hive box
  final _myBox = Hive.box('myBox');
  ToDodatabase db = ToDodatabase();

  @override
  void initState() {
    
    //first time app open , default data
    if(_myBox.get("TODO") == null)
    {
      db.createInitialdata();
    }
    //data already exists
    else
    {
      db.loadData();
    }

    super.initState();
  }

  //text controller
  final _controller = TextEditingController();


  //checkbox tapping
  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDatabase();
  }

  //save new task
  void saveNewTask(){
    setState(() {
      db.todolist.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    db.updateDatabase();
  }

  //delete task
  void deletetask(int index){
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: createNewTask,
        child: const Icon(Icons.add,color: Colors.deepOrangeAccent,size: 40),
      ),

      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return Tiles(
            taskName: db.todolist[index][0],
            taskcompleted: db.todolist[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deleteFunction: (context) => deletetask(index),
          );
        },
      ),
    );
  }
}
