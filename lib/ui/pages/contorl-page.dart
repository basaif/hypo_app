import 'package:flutter/material.dart';
import 'package:hypoapp/app/colors.dart';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        color: ColorSets.lightGrey,
        child: Container(
            color: ColorSets.white,
            margin: const EdgeInsets.all(10.0),
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: LayoutBuilder(builder: (BuildContext context,
                    BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: viewportConstraints.maxHeight,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                //TODO add the real control widgets
                                Text("control"),
                              ])));
                }))));
  }
}