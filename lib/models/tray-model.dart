
//import 'package:hypoapp/fake-data.dart';
import 'package:hypoapp/app-state.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';
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

  static startGrowing(DateTime startDate, PlantModel plant) async{
     //TODO: implement startGrowing
     currentTray.startDate = startDate;
     currentTray.growingPlant = plant;
     currentTray.growingData = List<ReadingsModel>();
     await TrayStorage.writeTray();
     await TrayStorage.writeTrayData();

  }

  static Future<void> getCurrentTray() async{
    //TODO: implement getCurrentTray
//    await TrayStorage.readTray();
//    await TrayStorage.readTrayData();
//    if(currentTray.growingData.length > 0){
//      await TrayStorage.writeTrayData();
//    }
////    currentTray.growingData = List<ReadingsModel>();
//        FakeData.populateReadings(currentTray.growingData);
  if(AppState.isGrowing){
      await TrayStorage.readTray();
      await TrayStorage.readTrayData();
  }
  else{
    currentTray.growingData = List<ReadingsModel>();
  }


  }

  static endCycle() async{
    //TODO: implement endCycle
    currentTray.endDate = DateTime.now();
    currentTray = TrayModel();
    await TrayStorage.deleteTrayData();

  }

}