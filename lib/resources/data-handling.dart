import 'package:http/http.dart' as http;
import 'package:hypoapp/app-state.dart';
import 'package:hypoapp/models/device-model.dart';
import 'package:hypoapp/models/plant-model.dart';
import 'package:hypoapp/models/readings-model.dart';
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

  static Future<bool> startGrowingHandler(String deviceCode, DateTime startDate, PlantModel plant) async{
    http.Response response = await ApiServices.startGrowing(http.Client(), deviceCode, TrayModel(startDate: startDate, growingPlant: plant));
    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }

  static Future<bool> endGrowingHandler(String deviceCode, DateTime endDate) async{
    http.Response response = await ApiServices.endGrowing(http.Client(), deviceCode, endDate);
    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }

  static Future<bool> getReadings(String deviceCode) async{
    http.Response response = await ApiServices.getTrayReadings(http.Client(), deviceCode);
    if(response.statusCode == 200){
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      TrayModel.currentTray.growingData = List<ReadingsModel>();
      TrayModel.currentTray.growingData = parsed.map<ReadingsModel>((json) => ReadingsModel.fromJson(json)).toList();
      return true;
    }
    else{
      return false;
    }
  }

  static Future<bool> lightsStateHandler(String deviceCode) async{
    http.Response response = await ApiServices.changeLightsState(http.Client(), deviceCode);
    if(response.statusCode == 201){
      return true;
    }
    else{
      return false;
    }
  }

  static Future<bool> waterPumpStateHandler(String deviceCode) async{
    http.Response response = await ApiServices.changeWaterPumpState(http.Client(), deviceCode);
    if(response.statusCode == 201){
      return true;
    }
    else{
      return false;
    }
  }

  static Future<bool> updateUserInfoHandler(String firstName, String lastName, String email) async{
    http.Response response = await ApiServices.updateUserInfo(http.Client(), firstName, lastName, email);
    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }

  static Future<bool> changePasswordHandler(String email, String password) async{
    http.Response response = await ApiServices.changePassword(http.Client(), email, password);
    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }




}