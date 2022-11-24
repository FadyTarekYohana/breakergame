import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:breakergame/data.dart';
import 'package:path_provider/path_provider.dart';

class UserModel {
  String? email;
  String? password;

  UserModel(String email, String password) {
    this.email = email;
    this.password = password;
    //users = getUsers();
  }

  bool login() {
    if (users.containsKey(email)) {
      if (users[email] == password) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool signup() {
    if (users.containsKey(email)) {
      return false;
    } else {
      updateUsers();
      return true;
    }
  }

  getUsers() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/users.dart');
    if (await file.exists()) {
      //users = await file.readAsString();
    } else {
      file.writeAsString('var users={};');
    }

    return users;
  }

  updateUsers() async {
    String str = await getUsers();
    const start = "{";
    const end = "}";

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);

    String users = str.substring(startIndex + start.length, endIndex);

    users =
        "${str.substring(0, startIndex + 1)}$users'$email': '$password',${str.substring(endIndex, endIndex + 2)}";
    print(users);
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/users.dart');
    file.writeAsString('var users={};');
  }
}
