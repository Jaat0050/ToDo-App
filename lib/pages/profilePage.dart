import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/constant.dart';
import 'package:todo_app/common_widgets/delete_dialogbox.dart';
import 'package:todo_app/data/sharedpref_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = SharedPreferencesHelper.getName();
    emailController.text = SharedPreferencesHelper.getUserEmail();
  }

  //Log out function
  void logOutFunction() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialogBox(
          onSave: () {
            SharedPreferencesHelper.clearShareCache();
            Hive.box('myBox').deleteFromDisk();
            SystemNavigator.pop();
          },
          onCancel: () => Navigator.of(context).pop(),
          isLogOut: true,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("PROFILE", style: GoogleFonts.lora(textStyle: TextStyle(color: Colors.white))),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        color: Colors.grey.shade200,
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
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                setState(() {
                  SharedPreferencesHelper.setName(name: nameController.text);
                });
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(),
                disabledBorder: UnderlineInputBorder(),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Email', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: const Color.fromRGBO(0, 0, 0, 1),
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              onChanged: (value) {
                setState(() {
                  SharedPreferencesHelper.setUserEmail(userEmail: emailController.text);
                });
              },
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w400),
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder(),
                disabledBorder: UnderlineInputBorder(),
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 35,
        width: 110,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appMainColor,
            elevation: 3,
            disabledBackgroundColor: appMainColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: appMainColor, width: 2),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () => logOutFunction(),
          child: Center(
            child: Text('Log Out ->', style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
      ),
    );
  }
}
