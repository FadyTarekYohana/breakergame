// To parse this JSON data, do
//
//     final level = levelFromJson(jsonString);

import 'dart:convert';

Level levelFromJson(String str) => Level.fromJson(json.decode(str));

String levelToJson(Level data) => json.encode(data.toJson());

class Level {
  Level({
    required this.id,
    required this.bricksx,
    required this.bricksy,
    required this.barriersx,
    required this.barriersy,
  });

  String id;
  List<double> bricksx;
  List<double> bricksy;
  List<double> barriersx;
  List<double> barriersy;

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        id: json["id"],
        bricksx: List<double>.from(json["bricksx"].map((x) => x.toDouble())),
        bricksy: List<double>.from(json["bricksy"].map((x) => x.toDouble())),
        barriersx:
            List<double>.from(json["barriersx"].map((x) => x.toDouble())),
        barriersy:
            List<double>.from(json["barriersy"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bricksx": List<dynamic>.from(bricksx.map((x) => x)),
        "bricksy": List<dynamic>.from(bricksy.map((x) => x)),
        "barriersx": List<dynamic>.from(barriersx.map((x) => x)),
        "barriersy": List<dynamic>.from(barriersy.map((x) => x)),
      };
}
