import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/ui/pages/login-page.dart';
import 'package:flutter/services.dart';

class HypoApp extends StatelessWidget {
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
        body: LoginPage(),
      ),
    );
  }
}
