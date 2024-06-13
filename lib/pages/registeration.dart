import 'package:flutter/material.dart';
import 'package:todo_app/bottomnav.dart';
import 'package:todo_app/data/constant.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/data/sharedpref_helper.dart';

class RegisterationScreen extends StatefulWidget {
  RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: appMainColor, elevation: 0, scrolledUnderElevation: 0, title: const Text('Registeration Screen')),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text('Full name', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                cursorColor: const Color.fromRGBO(0, 0, 0, 1),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter your name',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appMainColor), borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Email (Optional)', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                cursorColor: const Color.fromRGBO(0, 0, 0, 1),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Enter your email',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appMainColor), borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: SizedBox(
                  height: 45,
                  width: 250,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: appMainColor, elevation: 3, disabledBackgroundColor: appMainColor, shape: RoundedRectangleBorder(side: BorderSide(color: appMainColor, width: 2), borderRadius: BorderRadius.circular(25))),
                      onPressed: () {
                        if (nameController.text.isNotEmpty) {
                          SharedPreferencesHelper.setName(name: nameController.text);
                          SharedPreferencesHelper.setUserEmail(userEmail: emailController.text ?? "");
                          Navigator.of(context).pushAndRemoveUntil(
                            PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) {
                                  return BottomNav();
                                },
                                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  return FadeTransition(opacity: animation, child: child);
                                },
                                transitionDuration: const Duration(milliseconds: 500)),
                            (route) => false,
                          );
                        } else {
                          toastMsg("Name is required");
                        }
                      },
                      child: SizedBox(width: 200, child: Center(child: Text('Register', style: TextStyle(color: Colors.white, fontSize: 20))))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
