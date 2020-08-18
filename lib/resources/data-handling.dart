import 'package:http/http.dart' as http;
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/resources/services.dart';
import 'dart:convert';

class DataHandler{
  static Future<bool> getPlants() async{
    http.Response response = await ApiServices.getPlants(http.Client());
    if(response.statusCode == 200){
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      PlantModel.plantsList = parsed.map<PlantModel>((json) => PlantModel.fromJson(json)).toList();
      return true;
    }
    else{
      return false;
    }

  }
}