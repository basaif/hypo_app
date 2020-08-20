import 'dart:async';

import 'package:hypoapp/models/device-model.dart';
import 'package:hypoapp/resources/data-handling.dart';
import 'package:hypoapp/resources/tray-storage.dart';

class ReadingsModel {
  int id;
  DateTime dateOfReading;
  ReadingType readingType;
  double value;

  ReadingsModel({this.id, this.dateOfReading,
      this.readingType, this.value});

  factory ReadingsModel.fromJson(Map<String, dynamic> json) {
    return ReadingsModel(
      id: json['id'] as int,
      dateOfReading: DateTime.parse(json['dateOfReading']),
      readingType: ReadingType.values.firstWhere((e) => e.toString() == "ReadingType."+json['readingType']),
      value: json['value'] as double,
    );
  }

  static Future<bool> getReadings() async{
    bool result = await DataHandler.getReadings(DeviceModel.currentDevice.deviceCode);
    if(result){
      TrayStorage.writeTrayData();
      return true;
    }
    else{
      await TrayStorage.readTrayData();
      return false;
    }

  }

}

enum ReadingType {
  EC,
  pH

}