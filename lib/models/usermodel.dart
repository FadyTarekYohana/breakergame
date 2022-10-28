import 'package:breakergame/data.dart';

class UserModel {
  final email, password;

  UserModel(this.email, this.password);

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
}
