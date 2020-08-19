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

  UserModel.fromMap({this.firstName, this.lastName, this.emailAddress, this.password, this.id});

  UserModel.init();

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel.fromMap(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );
  }

  static Future<bool> login(String email, String password)async{
//    currentUser = UserModel("Jimmy", "Kimmel", email, password);
//    UserStorage.writeUser();
//    return true;

    bool result = await DataHandler.loginHandler(email, password);
    if (result){
      currentUser.emailAddress = email;
      currentUser.password = password;
      UserStorage.writeUser();
      DeviceStorage.writeCurrentMeasurements();
      DeviceStorage.writeDevice();
      return result;
    }
    else{
      return result;
    }

  }

  static void recoverPassword(String email){
    //TODO: implement recover password
  }

  static bool signUp(String firstName, String lastName, String email, String password){
    //TODO: implement signUp
    currentUser = UserModel(firstName, lastName, email, password);
    UserStorage.writeUser();
    return true;
  }

  static bool registerDevice(String email, String deviceCode){
    //TODO: implement registerDevice

    return true;
  }

  static bool editUserInfo(String firstName, String lastName, String email){
    //TODO: implement editUserInfo
    currentUser.firstName = firstName;
    currentUser.lastName = lastName;
    currentUser.emailAddress = email;
    UserStorage.writeUser();
    return true;
  }

  static bool changePassword(String newPassword){
    //TODO: implement changePassword
    currentUser.password = newPassword;
    UserStorage.writeUser();
    return true;
  }

  static logout(){
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