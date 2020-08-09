import 'package:hypoapp/models/device-model.dart';

class UserModel {
  String firstName;
  String lastName;
  String emailAddress;
  String password;
  DeviceModel device;

  UserModel(this.firstName, this.lastName, this.emailAddress, this.password);

}