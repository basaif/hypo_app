import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/fake-data.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';

class TrayModel{
  int id;
  DateTime startDate;
  DateTime endDate;
  PlantModel growingPlant;
  List<ReadingsModel> growingData;

  static TrayModel currentTray = TrayModel();

  TrayModel({this.id, this.growingPlant, this.startDate,
    this.growingData});

   List<ReadingsModel> getTypeBasedData(ReadingType readingType){
    List<ReadingsModel> typeData = List<ReadingsModel>();
    growingData.forEach((reading) => {
      if (reading.readingType == readingType){
        typeData.add(reading)
      }
    });
    return typeData;
  }

  static startGrowing(DateTime startDate, PlantModel plant){
     //TODO: implement startGrowing
     currentTray.startDate = startDate;
     currentTray.growingPlant = plant;
     currentTray.growingData = List<ReadingsModel>();

  }

  static getCurrentTray(){
    //TODO: implement getCurrentTray
    currentTray.startDate = DateTime(2020, 7, 20);
    currentTray.growingPlant = PlantModel(
        1,
        "Leafy Vegetables",
        "Salads, artichoke, basil, lettuce and other herbs",
        AppImages.vegeiesIcon);
    currentTray.growingData = List<ReadingsModel>();
        FakeData.populateReadings(currentTray.growingData);
  }

  static endCycle(){
    //TODO: implement endCycle
    currentTray.endDate = DateTime.now();
    currentTray = TrayModel();

  }

}