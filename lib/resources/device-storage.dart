import 'dart:async';
import 'dart:io';

import 'package:hypoapp/models/device-model.dart';
import 'package:path_provider/path_provider.dart';

class DeviceStorage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/device-current-measurements.txt');
  }

  static Future<String> get _localDevicePath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localDeviceFile async {
    final path = await _localDevicePath;
    return File('$path/device.txt');
  }

  static Future<void> readDevice() async {
    try {
      final file = await _localDeviceFile;

      // Read the file
      String contents = await file.readAsString();

      List<String> list = contents.split("; ");

      DeviceModel.currentDevice.deviceCode = list[0];

      DeviceModel.currentDevice.maxWaterLevel = int.parse(list[1]);
      DeviceModel.currentDevice.maxNSLevel = int.parse(list[2]);
      DeviceModel.currentDevice.maxPhUplevel = int.parse(list[3]);
      DeviceModel.currentDevice.maxPhDownLevel = int.parse(list[4]);

    } catch (e) {
      // If encountering an error, return 0
      DeviceModel.currentDevice.deviceCode = "0";

      DeviceModel.currentDevice.maxWaterLevel = 0;
      DeviceModel.currentDevice.maxNSLevel = 0;
      DeviceModel.currentDevice.maxPhUplevel = 0;
      DeviceModel.currentDevice.maxPhDownLevel = 0;
    }
  }

  static Future<File> writeDevice() async {
    final file = await _localDeviceFile;

    String device = DeviceModel.currentDevice.deviceCode + "; "
        + DeviceModel.currentDevice.maxWaterLevel.toString()  + "; "
        + DeviceModel.currentDevice.maxNSLevel.toString()  + "; "
        + DeviceModel.currentDevice.maxPhUplevel.toString() + "; "
        + DeviceModel.currentDevice.maxPhDownLevel.toString() ;

    // Write the file
    return file.writeAsString('$device');
  }

  static Future<void> deleteDevice() async {
    final file = await _localDeviceFile;
    file.writeAsStringSync("");
  }

  static Future<void> readCurrentMeasurements() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      List<String> list = contents.split("; ");

      DeviceModel.currentDevice.currentWaterLevel = int.parse(list[0]);
      DeviceModel.currentDevice.currentNSLevel = int.parse(list[1]);
      DeviceModel.currentDevice.currentPhUpLevel = int.parse(list[2]);
      DeviceModel.currentDevice.currentPhDownLevel = int.parse(list[3]);

    } catch (e) {
      // If encountering an error, return 0
      DeviceModel.currentDevice.currentWaterLevel = 0;
      DeviceModel.currentDevice.currentNSLevel = 0;
      DeviceModel.currentDevice.currentPhUpLevel = 0;
      DeviceModel.currentDevice.currentPhDownLevel = 0;
    }
  }

  static Future<File> writeCurrentMeasurements() async {
    final file = await _localFile;

    String currentMeasurements = DeviceModel.currentDevice.currentWaterLevel.toString() + "; "
        + DeviceModel.currentDevice.currentNSLevel.toString()  + "; "
        + DeviceModel.currentDevice.currentPhUpLevel.toString()  + "; "
        + DeviceModel.currentDevice.currentPhDownLevel.toString() ;

    // Write the file
    return file.writeAsString('$currentMeasurements');
  }

}