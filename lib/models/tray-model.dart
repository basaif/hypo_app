import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';

class TrayModel{
  int id;
  DateTime startDate;
  DateTime endDate;
  PlantModel growingPlant;
  List<ReadingsModel> growingData;

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

}