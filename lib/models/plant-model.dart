import 'package:hypoapp/app/images.dart';

class PlantModel{
  int id;
  String groupName;
  String description;
  String imageLocation;
  static List<PlantModel> plantsList;

  PlantModel(this.id, this.groupName, this.description, this.imageLocation);

  static bool getAvailablePlants(){
    //TODO: implement getAvailablePlants
    plantsList = List<PlantModel>();
    plantsList.add(PlantModel(
        1,
        "Leafy Vegetables",
        "Salads, artichoke, basil, lettuce and other herbs",
        AppImages.vegeiesIcon));
    plantsList.add(PlantModel(2, "Fruit", "Tomatoes, peppers and strawberries",
        AppImages.fruitsIcon));
    plantsList.add(PlantModel(
        3, "Other", "Cucumber, sweet corn and endives ", AppImages.otherIcon));
    return true;

  }

}