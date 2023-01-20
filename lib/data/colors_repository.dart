import 'package:breakergame/util/user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorsNotifier extends StateNotifier<List<dynamic>> {
  ColorsNotifier() : super([]);
  void addToColors(String color) {
    state = [...state, color];
  }
}

final colorsProvider =
    StateNotifierProvider<ColorsNotifier, List<dynamic>>((ref) {
  return ColorsNotifier();
});

void setColors(List<dynamic> color) {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({'colors': color});
}

final equippedColorProvider =
    StateProvider<String>((ref) => UserSimplePreferences.getEquippedColor());
