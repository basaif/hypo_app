import 'package:dio/dio.dart';
import 'package:hypoapp/app/urls.dart';
import 'package:hypoapp/models/tray-model.dart';

class ApiServices{

  static Future<Response> userLogin(String email, String password) async {
    return Dio().post(AppUrls.loginUrl, data: {"email": email, "password": password});
  }

  static Future<Response> userSignUp(String firstName, String lastName, String email, String password) async {
    return Dio().post(AppUrls.signUpUrl, data: {"firstName": firstName, "lastName": lastName, "email": email, "password": password});
  }

  static Future<Response> registerDevice(String email, String deviceCode) async {
    return Dio().post(AppUrls.registerDeviceUrl, data: {"email": email, "deviceCode": deviceCode});
  }

  static Future<Response<List>> getPlants() async {
    return Dio().get(AppUrls.getPlantsUrl);
  }

  static Future<Response> updateDeviceMeasurements(String deviceCode) async {
    return Dio().post(AppUrls.updateDeviceMeasurementsUrl, data: {"deviceCode": deviceCode});
  }

  static Future<Response> startGrowing(String deviceCode, TrayModel tray) async {
    return Dio().post(AppUrls.startGrowingUrl,
        data: {
      "deviceCode": deviceCode,
      "startDate": tray.startDate.toIso8601String(),
      "growingPlant" : {
        "groupName": tray.growingPlant.groupName,
        "description": tray.growingPlant.description,
        "image": tray.growingPlant.imageLocation
      }});
  }

  static Future<Response> endGrowing(String deviceCode, DateTime endDate) async {
    return Dio().post(AppUrls.endGrowingUrl, data: {"deviceCode": deviceCode, "endDate": endDate.toIso8601String()});
  }

  static Future<Response<List>> getTrayReadings(String deviceCode) async {
    return Dio().post(AppUrls.getTrayReadingsUrl, data: {"deviceCode": deviceCode});
  }

  static Future<Response> changeLightsState(String deviceCode) async {
    return Dio().post(AppUrls.changeLightsUrl, data: {"deviceCode": deviceCode});
  }

  static Future<Response> changeWaterPumpState(String deviceCode) async {
    return Dio().post(AppUrls.changeWaterPumpUrl, data: {"deviceCode": deviceCode});
  }

  static Future<Response> updateUserInfo(String firstName, String lastName, String email) async {
    return Dio().post(AppUrls.updateUserInfoUrl, data: {"firstName": firstName, "lastName": lastName, "email": email});
  }

  static Future<Response> changePassword(String email, String password) async {
    return Dio().post(AppUrls.changePasswordUrl, data: {"email": email, "password": password});
  }


}