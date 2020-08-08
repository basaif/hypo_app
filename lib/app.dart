import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/ui/pages/app-skeleton-page.dart';
import 'package:flutter/services.dart';
import 'package:hypoapp/ui/pages/login-page.dart';

class HypoApp extends StatelessWidget {
  final bool isUserLoggedIn;
  HypoApp(this.isUserLoggedIn);

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
        body: isUserLoggedIn ? AppSkeleton() : LoginPage(),
      ),
    );
  }
}
