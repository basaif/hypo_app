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
    if(response.statusCode == 201){
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

  static Future<bool> signupHandler(String firstName, String lastName, String email, String password) async{
    http.Response response = await ApiServices.userSignUp(http.Client(), firstName, lastName, email, password);
    if(response.statusCode == 201){
      return true;
    }
    else{
      return false;
    }

  }

  static Future<bool> registeringHandler(String email, String deviceCode) async{
    http.Response response = await ApiServices.registerDevice(http.Client(), email, deviceCode);
    if(response.statusCode == 201){

      final parsed = json.decode(response.body);
      DeviceModel.currentDevice = DeviceModel.fromJson(parsed);
      DeviceModel.currentDevice.deviceCode = deviceCode;
      return true;
    }
    else{
      return false;
    }

  }

  static Future<bool> measurementsHandler(String deviceCode) async{
    http.Response response = await ApiServices.updateDeviceMeasurements(http.Client(), deviceCode);
    if(response.statusCode == 201){

      final parsed = json.decode(response.body);
      DeviceModel.currentDevice.currentWaterLevel = parsed["currentWaterLevel"];
      DeviceModel.currentDevice.currentNSLevel = parsed["currentNSLevel"];
      DeviceModel.currentDevice.currentPhUpLevel = parsed["currentPhUpLevel"];
      DeviceModel.currentDevice.currentPhDownLevel = parsed["currentPhDownLevel"];
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