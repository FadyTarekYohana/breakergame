import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/level.dart';

var levels = [];

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

Future<Map<String, dynamic>?> readLevel(String id) async {
  var collection = FirebaseFirestore.instance.collection('levels');
  var docSnapshot = await collection.doc(id).get();
  Map<String, dynamic>? data = docSnapshot.data();

  return data;
}
