import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: ColorSets.lightGrey,
        child: Container(
            color: ColorSets.white,
            margin: const EdgeInsets.all(10.0),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Center(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                //TODO add the real home widgets
                                FirstTimeHomeContent(),
                              ]))));
                }))));
  }
}

class FirstTimeHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
           Text(
              AppStrings.noGrowingCycleMessage,
              style: AppTextStyles.bodyHeadlines,
                  textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ButtonTheme(
                minWidth: 200.0,
                height: 70.0,
                child: RaisedButton(
                  padding: EdgeInsets.all(20.0),
                  onPressed: () {
                    // Validate returns true if the form is valid, otherwise false.

                    //TODO write start growing button logic
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  },
                  child: Text(
                    AppStrings.startGrowing,
                    style: AppTextStyles.buttons,
                  ),
                  color: ColorSets.primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
