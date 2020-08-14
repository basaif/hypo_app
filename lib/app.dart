import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/models/user-model.dart';
import 'package:hypoapp/ui/pages/app-skeleton-page.dart';
import 'package:flutter/services.dart';
import 'package:hypoapp/ui/pages/login-page.dart';

import 'app-state.dart';

class HypoApp extends StatefulWidget{
  @override
  HypoAppState createState() {
    return HypoAppState();
  }

}

class HypoAppState extends State<StatefulWidget> {

  Widget _body = Center(child: CircularProgressIndicator(),);
  void _loadHome() async{
    await AppState.loadState();
    if(AppState.isLoggedIn == null){
      setState(() {
        _body = Center(child: CircularProgressIndicator(),);
      });
    }
    else{
      if (AppState.isLoggedIn){
        UserModel.loadCurrentUser();
        setState(() {
          _body = AppSkeleton();
        });

      }
      else{
        setState(() {
          _body = LoginPage();
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadHome();
  }

  @override
  Widget build(BuildContext context) {
    //this forces the app to be in portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: "Hypo App",
      theme: ThemeData(
        primarySwatch: ColorSets.primaryGreen,
      ),
      home: Scaffold(
        body:_body
    ));
  }
}
