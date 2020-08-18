import 'dart:math';

import 'package:hypoapp/models/tray-model.dart';
import 'package:hypoapp/resources/device-storage.dart';

class DeviceModel {
  String deviceCode;
  int currentWaterLevel;
  int maxWaterLevel;
  int currentNSLevel;
  int maxNSLevel;
  int currentPhUpLevel;
  int maxPhUplevel;
  int currentPhDownLevel;
  int maxPhDownLevel;
  TrayModel currentTray;
  List<TrayModel> traysList;

  static DeviceModel currentDevice = DeviceModel();

  DeviceModel({this.deviceCode});
  DeviceModel.fromMap({this.deviceCode, this.maxWaterLevel, this.maxNSLevel, this.maxPhUplevel, this.maxPhDownLevel});

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel.fromMap(
      deviceCode: json['deviceCode'] as String,
      maxWaterLevel: json['maxWaterLevel'] as int,
      maxNSLevel: json['maxNSLevel'] as int,
      maxPhUplevel: json['maxPhUplevel'] as int,
      maxPhDownLevel: json['maxPhDownLevel'] as int,
    );
  }

  static Future<void> getMeasurements() async{
    //TODO: implement get measurements
    if(true){
      currentDevice.currentWaterLevel = Random().nextInt(100);
      currentDevice.currentNSLevel = Random().nextInt(100);
      currentDevice.currentPhUpLevel = Random().nextInt(100);
      currentDevice.currentPhDownLevel = Random().nextInt(100);
      DeviceStorage.writeCurrentMeasurements();
    }
    else{
      await DeviceStorage.readCurrentMeasurements();
    }

  }

  static bool changeLightsState(){
    //TODO: implement changeLightsState
    return true;
  }

  static bool changeWaterPumpState(){
    //TODO: implement changeWaterPumpState
    return true;

  }
}