//import 'package:hypoapp/app/images.dart';
import 'package:hypoapp/resources/data-handling.dart';

class PlantModel{
  int id;
  String groupName;
  String description;
  String imageLocation;
  static List<PlantModel> plantsList;
  static bool canGetPlants;

  PlantModel(this.id, this.groupName, this.description, this.imageLocation);
  PlantModel.init();

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['image'] as String,
    );
  }

  static Future<void> getAvailablePlants() async{

    if(plantsList == null){
      bool result = await DataHandler.getPlants();
      canGetPlants = result;
    }

//    plantsList = List<PlantModel>();
//    plantsList.add(PlantModel(
//        1,
//        "Leafy Vegetables",
//        "Salads, artichoke, basil, lettuce and other herbs",
//        AppImages.vegeiesIcon));
//    plantsList.add(PlantModel(2, "Fruit", "Tomatoes, peppers and strawberries",
//        AppImages.plantPlaceHolderImage));
//    plantsList.add(PlantModel(
//        3, "Other", "Cucumber, sweet corn and endives ", AppImages.otherIcon));
//   canGetPlants = true;

  }

}