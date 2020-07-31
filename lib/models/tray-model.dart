import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';

class TrayModel{
  int id;
  DateTime startDate;
  DateTime endDate;
  PlantModel growingPlant;
  List<ReadingsModel> growingData;
}