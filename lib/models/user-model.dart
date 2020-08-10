import 'package:hypoapp/models/device-model.dart';

class UserModel {
  String firstName;
  String lastName;
  String emailAddress;
  String password;
  DeviceModel device;
  static UserModel currentUser;

  UserModel(this.firstName, this.lastName, this.emailAddress, this.password);

  UserModel.init();

  static bool login(String email, String password){
    //TODO: implement login
    currentUser = UserModel("Jimmy", "Kimmel", email, password);
    return true;
  }

  static void recoverPassword(String email){
    //TODO: implement recover password
  }

  static bool signUp(String firstName, String lastName, String email, String password){
    //TODO: implement signUp
    currentUser = UserModel(firstName, lastName, email, password);
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
    return true;
  }

  static bool changePassword(String newPassword){
    //TODO: implement changePassword
    currentUser.password = newPassword;
    return true;
  }

  static logout(){
    currentUser = UserModel.init();
  }



}