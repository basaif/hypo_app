import 'package:http/http.dart' as http;
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/user-model.dart';
import 'package:hypoapp/resources/services.dart';
import 'dart:convert';

class DataHandler{

  static Future<bool> loginHandler(String email, String password) async{
    http.Response response = await ApiServices.userLogin(http.Client(), email, password);
    if(response.statusCode == 201){
      UserModel.currentUser = UserModel.fromJson(json.decode(response.body));
      return true;
    }
    else{
      return false;
    }

  }

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