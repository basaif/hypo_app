import 'package:shared_preferences/shared_preferences.dart';

class AppState{
  static bool isGrowing = false;
  static bool isLoggedIn = false;

  static loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isGrowing = prefs.getBool('isGrowing') ?? false;
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  }

  static setStateLogged(bool logged) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', logged);
    isLoggedIn = logged;
  }

  static setStateGrowing(bool growing) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isGrowing', growing);
    isGrowing = growing;
  }


}

