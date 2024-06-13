import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/constant.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/registeration.dart';
import 'package:todo_app/data/sharedpref_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      SharedPreferencesHelper.setisFirstTime(isFirstTime: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.06),

              //----------------------------------------------image----------------------------------//

              const Spacer(),
              Image(
                image: AssetImage(
                  board[0].image,
                ),
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Spacer(),

              //----------------------------------------------text 1----------------------------------//
              Container(
                height: 60,
                width: width,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Text(
                    "WELCOME",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: GoogleFonts.inter(textStyle: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.black)),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              //----------------------------------------------button----------------------------------//
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appMainColor,
                    disabledBackgroundColor: appMainColor,
                    minimumSize: const Size(double.infinity, 35),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pushAndRemoveUntil(
                        PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return RegisterationScreen();
                            },
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            transitionDuration: const Duration(milliseconds: 500)),
                        (route) => false);
                  },
                  child: Text(
                    'Next',
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.06),
            ],
          )),
    );
  }
}

class UnbordingContent {
  String image;

  UnbordingContent({required this.image});
}

List<UnbordingContent> board = [UnbordingContent(image: toDoListGIF)];
