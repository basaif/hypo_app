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

  static DeviceModel currentDevice = DeviceModel();

  DeviceModel({this.deviceCode});
  DeviceModel.fromMap({this.deviceCode, this.maxWaterLevel, this.maxNSLevel, this.maxPhUplevel, this.maxPhDownLevel,
  this.currentWaterLevel, this.currentNSLevel, this.currentPhUpLevel, this.currentPhDownLevel});

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel.fromMap(
      deviceCode: json['deviceCode'] as String,
      maxWaterLevel: json['maxWaterLevel'] as int,
      maxNSLevel: json['maxNSLevel'] as int,
      maxPhUplevel: json['maxPhUplevel'] as int,
      maxPhDownLevel: json['maxPhDownLevel'] as int,
      currentWaterLevel: json['currentWaterLevel'] as int,
      currentNSLevel: json['currentNSLevel'] as int,
      currentPhUpLevel: json['currentPhUpLevel'] as int,
      currentPhDownLevel: json['currentPhDownLevel'] as int,
    );
  }

  static Future<void> getMeasurements() async{
    //TODO: implement get measurements
    if(false){
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

  static loadCurrentDevice() {
//    currentDevice = DeviceModel.fromMap(
//      deviceCode: "8999",
//      maxWaterLevel: 100,
//      maxNSLevel: 100,
//      maxPhUplevel: 100,
//      maxPhDownLevel: 100,
//      currentWaterLevel: 100,
//      currentNSLevel: 100,
//      currentPhUpLevel: 100,
//      currentPhDownLevel: 100,
//    );
    DeviceStorage.readDevice();
    DeviceStorage.deleteDevice();
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