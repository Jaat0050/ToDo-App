import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
            child: Text(
              "ToDo App",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          backgroundColor: Colors.orange),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/A3.png"),
               fit: BoxFit.fill,
               colorFilter: ColorFilter.mode(Colors.orange, BlendMode.color)
               ),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
              fixedSize: const Size(double.infinity, double.infinity),
              foregroundColor: Colors.orange,
              ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          child: const Text("Tap to open",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,fontStyle: FontStyle.italic),),
        ),
      ),
    );
  }
}
