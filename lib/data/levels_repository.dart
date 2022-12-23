import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/level.dart';

var levels = [];

final levelsProvider = Provider<List<dynamic>>((ref) {
  return [];
});

write(String text) async {
  String date = DateTime.now().toString().replaceAll(RegExp(r'[^0-9]'), '');
  String filename = "lvl$date.json";
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/$filename');
  file.writeAsString(text);
  addToLevelsList(filename);
}

Future<String> read(filename) async {
  String text = '';
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/$filename');
    text = await file.readAsString();
  } catch (e) {
    print("Couldn't read file");
  }
  return text;
}

addToLevelsList(String levelname) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/levels.json');
  if (await file.exists()) {
    levels = jsonDecode(await read('levels.json'));
    levels.add(levelname);
    file.writeAsString(jsonEncode(levels));
  } else {
    levels.add(levelname);
    file.writeAsString(jsonEncode(levels));
  }
}

deleteLevel(filename) async {
  final Directory directory = await getApplicationDocumentsDirectory();
  final File file = File('${directory.path}/$filename');
  file.delete();
}

void createLevel(List<List<double>> bricks, List<List<double>> barriers) async {
  final List<double> bricksx = [], bricksy = [], barriersx = [], barriersy = [];
  final flattenedBricks = bricks.expand((element) => element).toList();
  final flattenedBarriers = barriers.expand((element) => element).toList();

  for (int i = 0; i < flattenedBricks.length; i++) {
    i % 2 == 0
        ? bricksy.add(flattenedBricks[i])
        : bricksx.add(flattenedBricks[i]);
  }
  for (int i = 0; i < flattenedBarriers.length; i++) {
    i % 2 == 0
        ? barriersy.add(flattenedBarriers[i])
        : barriersx.add(flattenedBarriers[i]);
  }

  final docLevels = FirebaseFirestore.instance.collection('levels').doc();
  final level = Level(
      id: docLevels.id,
      bricksx: bricksx,
      bricksy: bricksy,
      barriersx: barriersx,
      barriersy: barriersy);
  final json = level.toJson();
  await docLevels.set(json);
}

Stream<List<Level>> readLevels() {
  return FirebaseFirestore.instance.collection('levels').snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => Level.fromJson(doc.data())).toList());
}
