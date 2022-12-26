// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.email,
    required this.type,
    required this.coins,
    required this.colors,
  });

  String id;
  String email;
  String type;
  int coins;
  List<String> colors;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        type: json["type"],
        coins: json["coins"],
        colors: List<String>.from(json["colors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "type": type,
        "coins": coins,
        "colors": List<dynamic>.from(colors.map((x) => x)),
      };
}
