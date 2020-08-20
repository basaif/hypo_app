import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypoapp/app/colors.dart';
import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/app/strings.dart';
import 'package:hypoapp/app/textStyles.dart';
import 'package:hypoapp/models/device-model.dart';

class MonitorPage extends StatelessWidget {
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
                                MonitorContent(),
                              ])));
                }))));
  }
}

class MonitorContent extends StatefulWidget{
  @override
  MonitorContentState createState() {
    return MonitorContentState();
  }
}

class MonitorContentState extends State<MonitorContent> {
  Widget _body = Center(child: CircularProgressIndicator(),);

  String waterLevel;
  String nutrientSolution;
  String phUpBuffer;
  String phDownBuffer;

  void _loadHome() async{
    bool canGetMeasurements = await DeviceModel.getMeasurements();
    if(DeviceModel.currentDevice.currentWaterLevel == null){
      setState(() {
        _body = Center(child: CircularProgressIndicator(),);
      });
    }
    else{
      setState(() {
        waterLevel = DeviceModel.currentDevice.currentWaterLevel.toString();
        nutrientSolution = DeviceModel.currentDevice.currentNSLevel.toString();
        phUpBuffer = DeviceModel.currentDevice.currentPhUpLevel.toString();
        phDownBuffer = DeviceModel.currentDevice.currentPhDownLevel.toString();
        _body = _loadedBody();
      });
      if(!canGetMeasurements){
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(AppStrings.measurementsError), duration: Duration(seconds: 3),)
        );
      }
      }
    }




  void initState() {
    super.initState();
    _loadHome();
  }

  @override
  Widget build(BuildContext context) {

    return _body;
  }

  Widget _loadedBody(){
    return Container(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  SystemSound.play(SystemSoundType.click);
                  setState(() {

                    _loadHome();
                  });
                },
                child:
               Card(
                  margin: EdgeInsets.only(bottom: 30),
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Padding(
                          padding: EdgeInsets.only(left: 25),
                          child:Image.asset(
                            AppImages.waterLevelIcon,
                            height: 100.0,
                          )),
                      Padding(
                          padding: EdgeInsets.only(right: 50),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    AppStrings.waterLevel,
                                    style: AppTextStyles.bodyHeadlines,
                                  )),
                              Row(
                                children: <Widget>[
                                  Text(
                                    waterLevel,
                                    style: AppTextStyles.measurementText,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4, right: 4),
                                  ),
                                  Text(
                                    AppStrings.centimeters,
                                    style: AppTextStyles.measurementText,
                                  )
                                ],
                              )
                            ],
                          )),

                    ],
                  ),

                )),
            GestureDetector(
                onTap: () {
                  SystemSound.play(SystemSoundType.click);
                  setState(() {
                    _loadHome();
                  });
                },
                child:Card(
                  margin: EdgeInsets.only(bottom: 30),
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Padding(
                          padding: EdgeInsets.only(left: 25),
                          child:Image.asset(
                            AppImages.nsLevelIcon,
                            height: 100.0,
                          )),
                      Padding(
                          padding: EdgeInsets.only(right: 30),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    AppStrings.nutrientSolution,
                                    style: AppTextStyles.bodyHeadlines,
                                  )),
                              Row(
                                children: <Widget>[
                                  Text(
                                    nutrientSolution,
                                    style: AppTextStyles.measurementText,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4, right: 4),
                                  ),
                                  Text(
                                    AppStrings.milliliters,
                                    style: AppTextStyles.measurementText,
                                  )
                                ],
                              )
                            ],
                          )),

                    ],
                  ),
                )),
            GestureDetector(
                onTap: () {
                  SystemSound.play(SystemSoundType.click);
                  setState(() {
                    _loadHome();
                  });
                },
                child:Card(
                  margin: EdgeInsets.only(bottom: 30),
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 25),
                          child:
                          Image.asset(
                            AppImages.phUpIcon,
                            height: 100.0,
                          )),
                      Padding(
                          padding: EdgeInsets.only(right: 40),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    AppStrings.phUpBuffer,
                                    style: AppTextStyles.bodyHeadlines,
                                  )),
                              Row(
                                children: <Widget>[
                                  Text(
                                    phUpBuffer,
                                    style: AppTextStyles.measurementText,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4, right: 4),
                                  ),
                                  Text(
                                    AppStrings.milliliters,
                                    style: AppTextStyles.measurementText,
                                  )
                                ],
                              )
                            ],
                          )),

                    ],
                  ),
                )),
            GestureDetector(
                onTap: () {
                  SystemSound.play(SystemSoundType.click);
                  setState(() {
                    _loadHome();
                  });
                },

                child:Card(
                  margin: EdgeInsets.only(bottom: 30),
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 25),
                          child: Image.asset(
                            AppImages.phDownIcon,
                            height: 100.0,
                          )),
                      Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    AppStrings.phDownBuffer,
                                    style: AppTextStyles.bodyHeadlines,
                                  )),
                              Row(
                                children: <Widget>[
                                  Text(
                                    phDownBuffer,
                                    style: AppTextStyles.measurementText,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4, right: 4),
                                  ),
                                  Text(
                                    AppStrings.milliliters,
                                    style: AppTextStyles.measurementText,
                                  )
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
