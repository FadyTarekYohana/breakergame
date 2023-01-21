import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoinsNotifier extends StateNotifier<int> {
  CoinsNotifier() : super(0);

  void buy(int price) {
    state -= price;
  }

  void levelReward(int reward) {
    state += reward;
  }
}

final coinsProvider = StateNotifierProvider<CoinsNotifier, int>((ref) {
  return CoinsNotifier();
});

void setCoins(int coins) {
  FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({'coins': coins});
}
