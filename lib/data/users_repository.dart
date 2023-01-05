import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:breakergame/domain/user.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

void createUser(String type, String email, String id) async {
  final docUsers = FirebaseFirestore.instance.collection('users').doc(id);
  final user =
      User(id: id, type: type, coins: 0, email: email, colors: ["grey"]);
  final json = user.toJson();
  await docUsers.set(json);
}

dynamic getAdminCode() async {
  var collection = FirebaseFirestore.instance.collection('adminCode');
  var docSnapshot = await collection.doc('1').get();
  Map<String, dynamic>? data = docSnapshot.data();
  var value = data?['code'];

  return value;
}

dynamic getUser() async {
  var collection = FirebaseFirestore.instance.collection('users');
  var docSnapshot =
      await collection.doc(FirebaseAuth.instance.currentUser!.uid).get();
  Map<String, dynamic>? data = docSnapshot.data();
  return data;
}

void setAdminCode(String code) {
  FirebaseFirestore.instance
      .collection('adminCode')
      .doc("1")
      .update({'code': code});
}
