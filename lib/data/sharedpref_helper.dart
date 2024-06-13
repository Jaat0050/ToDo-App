import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper _instance = SharedPreferencesHelper._ctor();

  factory SharedPreferencesHelper() {
    return _instance;
  }

  SharedPreferencesHelper._ctor();

  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//-------------------------------------------------------------
  static void setName({required String name}) {
    _prefs.setString("name", name);
  }

  static String getName() {
    return _prefs.getString("name") ?? "";
  }

//------------------------------------------------------------
  static void setUserEmail({required String userEmail}) {
    _prefs.setString("useremail", userEmail);
  }

  static String getUserEmail() {
    return _prefs.getString("useremail") ?? "";
  }

//-------------------------------------------------------------------
  static void setIsLoggedIn({required bool isLoggedIn}) {
    _prefs.setBool("isLoggedIn", isLoggedIn);
  }

  static bool getIsLoggedIn() {
    return _prefs.getBool("isLoggedIn") ?? false;
  }

//-------------------------------------------------------------------
  static void setisFirstTime({required bool isFirstTime}) {
    _prefs.setBool("isFirstTime", isFirstTime);
  }

  static bool getisFirstTime() {
    return _prefs.getBool("isFirstTime") ?? true;
  }

//---------------------------------------------------------------

  static void clearShareCache() {
    _prefs.clear();
  }
}
