import 'dart:convert';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

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
