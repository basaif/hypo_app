import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/ui/pages/login-page.dart';


class HypoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hypo App",
      theme: ThemeData(
        primarySwatch: ColorSets.primaryGreen,
      ),
      home: loginPage(),
    );
  }
}