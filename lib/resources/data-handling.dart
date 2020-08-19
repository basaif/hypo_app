import 'package:http/http.dart' as http;
import 'package:hypoapp/app-state.dart';
import 'package:hypoapp/models/device-model.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/tray-model.dart';
import 'package:hypoapp/models/user-model.dart';
import 'package:hypoapp/resources/services.dart';
import 'dart:convert';

class DataHandler{

  static Future<bool> loginHandler(String email, String password) async{
    http.Response response = await ApiServices.userLogin(http.Client(), email, password);
    if(response.statusCode == 200){
      final parsed = json.decode(response.body);
      UserModel.currentUser = UserModel.fromJson(parsed['user']);
      DeviceModel.currentDevice = DeviceModel.fromJson(parsed['device']);
      if (parsed['tray'] is String){
        AppState.setStateGrowing(false);
      }
      else{
        AppState.setStateGrowing(true);
        TrayModel.currentTray = TrayModel.fromJson(parsed['tray']);
      }

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