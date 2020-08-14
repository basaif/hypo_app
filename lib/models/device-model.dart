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