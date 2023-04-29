import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/welcome_page.dart';

void main() async{

  //initialise the hive
  await Hive.initFlutter();

  //open the box
  // ignore: unused_local_variable
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      darkTheme: ThemeData.dark(),
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }
}
