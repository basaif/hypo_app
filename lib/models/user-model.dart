import 'package:hypoapp/models/device-model.dart';
import 'package:hypoapp/resources/user-storage.dart';

class UserModel {
  int id = 1;
  String firstName;
  String lastName;
  String emailAddress;
  String password;
  DeviceModel device;
  static UserModel currentUser = UserModel.init();

  UserModel(this.firstName, this.lastName, this.emailAddress, this.password);

  UserModel.fromMap({this.firstName, this.lastName, this.emailAddress, this.password, this.id});

  UserModel.init();

  static bool login(String email, String password){
    //TODO: implement login
    currentUser = UserModel("Jimmy", "Kimmel", email, password);
    UserStorage.writeUser();
    return true;
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
    UserStorage.deleteUser();
  }

  static loadCurrentUser() {
    //TODO: implement loadCurrentUser
   //currentUser = UserModel("Sophie", "Scott", "sophie@scott.com", "23122");
    UserStorage.readUser();
  }

}