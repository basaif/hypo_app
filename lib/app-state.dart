import 'package:shared_preferences/shared_preferences.dart';

class AppState{
  static bool isGrowing;
  static bool isLoggedIn;

  static Future<void> loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isGrowing = prefs.getBool('isGrowing') ?? false;
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  }

  static setStateLogged(bool logged) async {
    isLoggedIn = logged;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', logged);

  }

  static setStateGrowing(bool growing) async {
    isGrowing = growing;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isGrowing', growing);

  }


}

