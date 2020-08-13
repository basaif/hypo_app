import 'dart:async';
import 'dart:io';

import 'package:hypoapp/models/user-model.dart';
import 'package:path_provider/path_provider.dart';

class UserStorage {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/user.txt');
  }

  static void readUser() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();
      
      List<String> list = contents.split("; ");

      UserModel.currentUser.firstName = list[0];
      UserModel.currentUser.lastName = list[1];
      UserModel.currentUser.emailAddress = list[2];
      UserModel.currentUser.password = list[3];

    } catch (e) {
      // If encountering an error, return 0
      UserModel.currentUser.firstName = "wrong";
      UserModel.currentUser.lastName = "wrong";
      UserModel.currentUser.emailAddress = "wrong@wrong.wrong";
      UserModel.currentUser.password = "wrong";
    }
  }

  static Future<File> writeUser() async {
    final file = await _localFile;

    String user = UserModel.currentUser.firstName + "; " + UserModel.currentUser.lastName + "; " +UserModel.currentUser.emailAddress + "; " +UserModel.currentUser.password;

    // Write the file
    return file.writeAsString('$user');
  }

  static void deleteUser() async {
    final file = await _localFile;

    String user = "";

    // Write the file
    file.writeAsString('$user');
  }
}