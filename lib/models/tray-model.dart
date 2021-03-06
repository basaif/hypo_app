
//import 'package:hypoapp/fake-data.dart';
import 'package:hypoapp/app-state.dart';
import 'package:hypoapp/models/device-model.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';
import 'package:hypoapp/resources/data-handling.dart';
import 'package:hypoapp/resources/tray-storage.dart';

class TrayModel{
  int id;
  DateTime startDate;
  DateTime endDate;
  PlantModel growingPlant;
  List<ReadingsModel> growingData;

  static TrayModel currentTray = TrayModel();

  TrayModel({this.id, this.growingPlant, this.startDate,
    this.growingData});

  factory TrayModel.fromJson(Map<String, dynamic> json) {
    return TrayModel(
      startDate: DateTime.parse(json['startDate']),
      growingPlant: PlantModel.fromJson(json['growingPlant']),
    );
  }

   List<ReadingsModel> getTypeBasedData(ReadingType readingType){
    List<ReadingsModel> typeData = List<ReadingsModel>();
    growingData.forEach((reading) => reading.readingType == readingType ?
        typeData.add(reading) : null);
    return typeData;
  }

  static Future<bool> startGrowing(DateTime startDate, PlantModel plant) async{
//     currentTray.startDate = startDate;
//     currentTray.growingPlant = plant;
//     currentTray.growingData = List<ReadingsModel>();
//     await TrayStorage.writeTray();
//     await TrayStorage.writeTrayData();

  bool result = await DataHandler.startGrowingHandler(DeviceModel.currentDevice.deviceCode, startDate, plant);
  if(result){
    currentTray.startDate = startDate;
     currentTray.growingPlant = plant;
     currentTray.growingData = List<ReadingsModel>();
     TrayStorage.writeTray();
    return true;
  }
  else{
    return false;
  }

  }

  static Future<bool> getCurrentTray() async{
//    await TrayStorage.readTray();
//    await TrayStorage.readTrayData();
//    if(currentTray.growingData.length > 0){
//      await TrayStorage.writeTrayData();
//    }
////    currentTray.growingData = List<ReadingsModel>();
//        FakeData.populateReadings(currentTray.growingData);

  if(AppState.isGrowing){
    await TrayStorage.readTray();
    bool canGetReadings = await ReadingsModel.getReadings();
    if(canGetReadings){
      TrayStorage.writeTrayData();
      return true;
    }
    else{
      await TrayStorage.readTrayData();
      return false;
    }
  }
  else{
   return false;
  }
  }

  static Future<bool> endCycle() async{

//    currentTray.endDate = DateTime.now();
//    currentTray = TrayModel();
//    await TrayStorage.deleteTrayData();
    bool result = await DataHandler.endGrowingHandler(DeviceModel.currentDevice.deviceCode, DateTime.now());
    if(result){
      currentTray.endDate = DateTime.now();
      currentTray = TrayModel();
      AppState.setStateGrowing(false);
      TrayStorage.deleteTrayData();
      TrayStorage.deleteTray();
      return true;
    }
    else{
      return false;
    }

  }

}