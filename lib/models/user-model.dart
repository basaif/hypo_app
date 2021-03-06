import 'package:hypoapp/models/device-model.dart';
import 'package:hypoapp/models/tray-model.dart';
import 'package:hypoapp/resources/data-handling.dart';
import 'package:hypoapp/resources/device-storage.dart';
import 'package:hypoapp/resources/tray-storage.dart';
import 'package:hypoapp/resources/user-storage.dart';

import '../app-state.dart';

class UserModel {
  int id = 1;
  String firstName;
  String lastName;
  String emailAddress;
  String password;
  static UserModel currentUser = UserModel.init();

  UserModel(this.firstName, this.lastName, this.emailAddress, this.password);

  UserModel.fromMap(
      {this.firstName,
      this.lastName,
      this.emailAddress,
      this.password,
      this.id});

  UserModel.init();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel.fromMap(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );
  }

  static Future<bool> login(String email, String password) async {
//    currentUser = UserModel("Jimmy", "Kimmel", email, password);
//    UserStorage.writeUser();
//    return true;

    bool result = await DataHandler.loginHandler(email, password);
    if (result) {
      currentUser.emailAddress = email;
      currentUser.password = password;
      UserStorage.writeUser();
      DeviceStorage.writeCurrentMeasurements();
      DeviceStorage.writeDevice();
      return result;
    } else {
      return result;
    }
  }

  static void recoverPassword(String email) {
    //TODO: implement recover password
  }

  static Future<bool> signUp(
      String firstName, String lastName, String email, String password) async {
//    currentUser = UserModel(firstName, lastName, email, password);
//    UserStorage.writeUser();
//    return true;
    bool result =
        await DataHandler.signupHandler(firstName, lastName, email, password);
    if (result) {
      currentUser = UserModel(firstName, lastName, email, password);
      UserStorage.writeUser();
      return result;
    } else {
      return result;
    }
  }

  static Future<bool> registerDevice(String email, String deviceCode) async {
    bool result = await DataHandler.registeringHandler(email, deviceCode);
    if (result) {
      DeviceStorage.writeDevice();
      DeviceStorage.writeCurrentMeasurements();

      return result;
    } else {
      return result;
    }
  }

  static Future<bool> editUserInfo(
      String firstName, String lastName, String email) async {
//    currentUser.firstName = firstName;
//    currentUser.lastName = lastName;
//    currentUser.emailAddress = email;
//    UserStorage.writeUser();
//    return true;
    bool result =
        await DataHandler.updateUserInfoHandler(firstName, lastName, email);
    if (result) {
      currentUser.firstName = firstName;
      currentUser.lastName = lastName;
      currentUser.emailAddress = email;
      UserStorage.writeUser();
      return true;
    }
    else{
      return false;
    }
  }

  static Future<bool> changePassword(String newPassword) async{
//    currentUser.password = newPassword;
//    UserStorage.writeUser();
//    return true;
    bool result =
        await DataHandler.changePasswordHandler(currentUser.emailAddress, newPassword);
    if (result) {
    currentUser.password = newPassword;
    UserStorage.writeUser();
      return true;
    }
    else{
      return false;
    }
  }

  static logout() {
    currentUser = UserModel.init();
    AppState.setStateLogged(false);
    AppState.setStateGrowing(false);
    TrayStorage.deleteTrayData();
    TrayModel.currentTray = TrayModel();
    UserStorage.deleteUser();
    DeviceStorage.deleteDevice();
    DeviceModel.currentDevice = DeviceModel();
  }

  static loadCurrentUser() {
    //currentUser = UserModel("Sophie", "Scott", "sophie@scott.com", "23122");
    UserStorage.readUser();
    DeviceModel.loadCurrentDevice();
  }
}
