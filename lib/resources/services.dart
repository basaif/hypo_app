import 'package:http/http.dart' as http;
import 'package:hypoapp/app/urls.dart';
import 'package:hypoapp/models/tray-model.dart';
import 'dart:convert';

class ApiServices{

  static Future<http.Response> userLogin(String email, String password) async {
    return http.post(AppUrls.loginUrl, body: jsonEncode(<String, String>{"email": email, "password": password}));
  }

  static Future<http.Response> userSignUp(String firstName, String lastName, String email, String password) async {
    return http.post(AppUrls.signUpUrl, body: jsonEncode(<String, String>{"firstName": firstName, "lastName": lastName, "email": email, "password": password}));
  }

  static Future<http.Response> registerDevice(String email, String deviceCode) async {
    return http.post(AppUrls.registerDeviceUrl, body: jsonEncode(<String, String>{"email": email, "deviceCode": deviceCode}));
  }

  static Future<http.Response> getPlants(http.Client client) async {
    return client.get(AppUrls.getPlantsUrl);
  }

  static Future<http.Response> updateDeviceMeasurements(String deviceCode) async {
    return http.post(AppUrls.updateDeviceMeasurementsUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> startGrowing(String deviceCode, TrayModel tray) async {
    return http.post(AppUrls.startGrowingUrl,
        body: jsonEncode(<String, dynamic>{
      "deviceCode": deviceCode,
      "startDate": tray.startDate,
      "growingPlant" : {
        "groupName": tray.growingPlant.groupName,
        "description": tray.growingPlant.description,
        "image": tray.growingPlant.imageLocation
      }}));
  }

  static Future<http.Response> endGrowing(String deviceCode, DateTime endDate) async {
    return http.post(AppUrls.endGrowingUrl, body: jsonEncode(<String, dynamic>{"deviceCode": deviceCode, "endDate": endDate}));
  }

  static Future<http.Response> getTrayReadings(String deviceCode) async {
    return http.post(AppUrls.getTrayReadingsUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> changeLightsState(String deviceCode) async {
    return http.post(AppUrls.changeLightsUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> changeWaterPumpState(String deviceCode) async {
    return http.post(AppUrls.changeWaterPumpUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> updateUserInfo(String firstName, String lastName, String email) async {
    return http.post(AppUrls.updateUserInfoUrl, body: jsonEncode(<String, String>{"firstName": firstName, "lastName": lastName, "email": email}));
  }

  static Future<http.Response> changePassword(String email, String password) async {
    return http.post(AppUrls.changePasswordUrl, body: jsonEncode(<String, String>{"email": email, "password": password}));
  }


}