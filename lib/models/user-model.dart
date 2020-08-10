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

  static recoverPassword(String email){
    //TODO: implement recover password
  }

}