import 'dart:async';
import 'dart:io';

import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';
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

  static Future<String> get _localReadingPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localReadingsFile async {
    final path = await _localReadingPath;
    return File('$path/readings.txt');
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
      TrayModel.currentTray.startDate = DateTime(2013, 2, 2);
      TrayModel.currentTray.growingPlant.groupName = "Shit";
      TrayModel.currentTray.growingPlant.description = "Dammit";
      TrayModel.currentTray.growingPlant.imageLocation =
          AppImages.waterLevelIcon;

    }
  }

  static Future<void> readTrayData() async{
    TrayModel.currentTray.growingData = List<ReadingsModel>();
    try{
      final rFile = await _localReadingsFile;
      List<String> listOfReadings = await rFile.readAsLines();
      for (int i = 0; i < listOfReadings.length; i++) {
        List<String> listOfValues = listOfReadings[i].split("; ");
        TrayModel.currentTray.growingData.add(ReadingsModel(
            id: i,
            dateOfReading: DateTime.parse(listOfValues[0]),
            value: double.parse(listOfValues[1]),
            readingType: ReadingType.values
                .firstWhere((e) => e.toString() == listOfValues[2])));
      }
    } catch (e){
      //FakeData.populateReadings(TrayModel.currentTray.growingData);
    }
  }

  static Future<void> writeTray() async {
    final file = await _localFile;


    String tray = TrayModel.currentTray.startDate.toIso8601String() +
        "; " +
        TrayModel.currentTray.growingPlant.groupName +
        "; " +
        TrayModel.currentTray.growingPlant.description +
        "; " +
        TrayModel.currentTray.growingPlant.imageLocation +
        "; ";


    // Write the file
    file.writeAsStringSync('$tray');
  }

  static Future<void> writeTrayData() async{
    final rFile = await _localReadingsFile;

    List<String> listOfReadings = await rFile.readAsLines();

    for(int i = listOfReadings.length > 0 ? listOfReadings.length - 1: 0; i < TrayModel.currentTray.growingData.length; i++)
    {
      String reading = TrayModel.currentTray.growingData[i].dateOfReading.toIso8601String() +
          "; " +
          TrayModel.currentTray.growingData[i].value.toString() +
          "; " +
          TrayModel.currentTray.growingData[i].readingType.toString() +
          "; ";
      rFile.writeAsStringSync('$reading\n', mode: FileMode.append);
    }
  }

  static Future<void> deleteTrayData() async {
    final rFile = await _localReadingsFile;
    rFile.writeAsStringSync("");
  }

}
