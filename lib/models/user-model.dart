import 'package:hypoapp/models/device-model.dart';

class UserModel {
  String firstName;
  String lastName;
  String emailAddress;
  String password;
  DeviceModel device;

  UserModel(this.firstName, this.lastName, this.emailAddress, this.password);

  static bool login(String email, String password){
    //TODO: implement login
    return true;
  }

  static void recoverPassword(String email){
    //TODO: implement recover password
  }

  static bool signUp(String firstName, String lastName, String email, String password){
    //TODO: implement signUp
    return true;
  }

  static bool registerDevice(String email, String deviceCode){
    //TODO: implement registerDevice
    return true;
  }

}