import 'package:http/http.dart' as http;
import 'package:hypoapp/app/urls.dart';
import 'package:hypoapp/models/tray-model.dart';
import 'dart:convert';

class ApiServices{

  static Future<http.Response> userLogin(http.Client client, String email, String password) async {
    return client.post(AppUrls.loginUrl, body: jsonEncode(<String, String>{"email": email, "password": password}));
    //return client.get(AppUrls.loginUrl);
  }

  static Future<http.Response> userSignUp(http.Client client, String firstName, String lastName, String email, String password) async {
    return client.post(AppUrls.signUpUrl, body: jsonEncode(<String, String>{"firstName": firstName, "lastName": lastName, "email": email, "password": password}));
  }

  static Future<http.Response> registerDevice(http.Client client, String email, String deviceCode) async {
    return client.post(AppUrls.registerDeviceUrl, body: jsonEncode(<String, String>{"email": email, "deviceCode": deviceCode}));
  }

  static Future<http.Response> getPlants(http.Client client) async {
    return client.get(AppUrls.getPlantsUrl);
  }

  static Future<http.Response> updateDeviceMeasurements(http.Client client, String deviceCode) async {
    return client.post(AppUrls.updateDeviceMeasurementsUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> startGrowing(http.Client client, String deviceCode, TrayModel tray) async {
    return client.post(AppUrls.startGrowingUrl,
        body: jsonEncode(<String, dynamic>{
      "deviceCode": deviceCode,
      "startDate": tray.startDate,
      "growingPlant" : {
        "groupName": tray.growingPlant.groupName,
        "description": tray.growingPlant.description,
        "image": tray.growingPlant.imageLocation
      }}));
  }

  static Future<http.Response> endGrowing(http.Client client, String deviceCode, DateTime endDate) async {
    return client.post(AppUrls.endGrowingUrl, body: jsonEncode(<String, dynamic>{"deviceCode": deviceCode, "endDate": endDate}));
  }

  static Future<http.Response> getTrayReadings(http.Client client, String deviceCode) async {
    return client.post(AppUrls.getTrayReadingsUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> changeLightsState(http.Client client, String deviceCode) async {
    return client.post(AppUrls.changeLightsUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> changeWaterPumpState(http.Client client, String deviceCode) async {
    return client.post(AppUrls.changeWaterPumpUrl, body: jsonEncode(<String, String>{"deviceCode": deviceCode}));
  }

  static Future<http.Response> updateUserInfo(http.Client client, String firstName, String lastName, String email) async {
    return client.post(AppUrls.updateUserInfoUrl, body: jsonEncode(<String, String>{"firstName": firstName, "lastName": lastName, "email": email}));
  }

  static Future<http.Response> changePassword(http.Client client, String email, String password) async {
    return client.post(AppUrls.changePasswordUrl, body: jsonEncode(<String, String>{"email": email, "password": password}));
  }

}