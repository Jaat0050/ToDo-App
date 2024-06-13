import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/bottomnav.dart';
import 'package:todo_app/data/constant.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/welcome_page.dart';
import 'package:todo_app/data/sharedpref_helper.dart';

bool? isLoggedIn = false;
bool? isFirstTime = true;
var box;

void main() async {
  try {
    await _initializePrefs();
  } catch (e) {
    print(e.toString());
  }

  runApp(const MyApp());
}

Future<void> _initializePrefs() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox('myBox');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: appMainColor, statusBarIconBrightness: Brightness.dark));
  await SharedPreferencesHelper.init();
  isFirstTime = SharedPreferencesHelper.getisFirstTime();
  isLoggedIn = SharedPreferencesHelper.getIsLoggedIn();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'TO DO List',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white), useMaterial3: false),
          home: AnimatedSplashScreen(
            splash: appIcon,
            centered: true,
            splashIconSize: double.infinity,
            nextScreen: Scaffold(
              body: DoubleBackToCloseApp(
                  snackBar: SnackBar(
                    backgroundColor: const Color(0xffF3F5F7),
                    shape: ShapeBorder.lerp(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)), const StadiumBorder(), 0.2)!,
                    width: 200,
                    behavior: SnackBarBehavior.floating,
                    content: Text('double tap to exit app', style: TextStyle(color: appMainColor), textAlign: TextAlign.center),
                    duration: const Duration(seconds: 2),
                  ),
                  child: SharedPreferencesHelper.getisFirstTime() ? const OnBoardingScreen() : BottomNav()),
            ),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
