import 'dart:async';
import 'dart:io';

import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/tray-model.dart';
import 'package:path_provider/path_provider.dart';

class TrayStorage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/tray.txt');
  }

  static Future<void> readTray() async {
    TrayModel.currentTray.growingPlant = PlantModel.init();
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      List<String> list = contents.split("; ");

      TrayModel.currentTray.startDate = DateTime.parse(list[0]);
      TrayModel.currentTray.growingPlant.groupName = list[1];
      TrayModel.currentTray.growingPlant.description = list[2];
      TrayModel.currentTray.growingPlant.imageLocation = list[3];

    } catch (e) {
      // If encountering an error, return 0
      TrayModel.currentTray.startDate = DateTime(2018, 7, 2);
      TrayModel.currentTray.growingPlant.groupName = "Nothing";
      TrayModel.currentTray.growingPlant.description = "Horrible mistake";
      TrayModel.currentTray.growingPlant.imageLocation = AppImages.waterLevelIcon;
    }
  }

  static Future<File> writeTray() async {
    final file = await _localFile;

    String tray = TrayModel.currentTray.startDate.toIso8601String() + "; "
    + TrayModel.currentTray.growingPlant.groupName + "; "
        + TrayModel.currentTray.growingPlant.description + "; "
        + TrayModel.currentTray.growingPlant.imageLocation + "; ";

    // Write the file
    return file.writeAsString('$tray');
  }

}