import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/textStyles.dart';

class loginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO - create the login page
    return Container(
        color: ColorSets.lightGrey,
        child: Container(
          color: ColorSets.white,
          margin: const EdgeInsets.all(10.0),
          child: Center(
            child: Text("help", style: AppTextStyles.logo,),
            ),
          ),
        );
  }
}


