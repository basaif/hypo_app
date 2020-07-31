import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';

class ControlPage extends StatelessWidget {
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
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ControlContent(),
                              ])));
                }))));
  }
}

class ControlContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(bottom: 30),
              elevation: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    AppImages.pumpIcon,
                    height: 100.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                AppStrings.waterPump,
                                style: AppTextStyles.bodyHeadlines,
                              )),
                          ButtonTheme(
                            minWidth: 150.0,
                            height: 45.0,
                            child: RaisedButton(
                              padding: EdgeInsets.all(5.0),
                              onPressed: () {
                                // TODO write the real on/off button logic for water pump
                              },
                              child: Text(
                                AppStrings.turnOnOff,
                                style: AppTextStyles.buttons,
                              ),
                              color: ColorSets.primaryGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 30),
              elevation: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    AppImages.lightsIcon,
                    height: 100.0,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                AppStrings.lights,
                                style: AppTextStyles.bodyHeadlines,
                              )),
                          ButtonTheme(
                            minWidth: 150.0,
                            height: 45.0,
                            child: RaisedButton(
                              padding: EdgeInsets.all(5.0),
                              onPressed: () {
                                // TODO write the real on/off button logic for lights
                              },
                              child: Text(
                                AppStrings.turnOnOff,
                                style: AppTextStyles.buttons,
                              ),
                              color: ColorSets.primaryGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
