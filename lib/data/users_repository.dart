import 'package:breakergame/domain/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void createUser(String type, String email, String id) async {
  final docLevels = FirebaseFirestore.instance.collection('users').doc();
  final user =
      User(id: id, type: type, coins: 0, email: email, colors: ["grey"]);
  final json = user.toJson();
  await docLevels.set(json);
}

dynamic getAdminCode() async {
  var collection = FirebaseFirestore.instance.collection('adminCode');
  var docSnapshot = await collection.doc('1').get();
  Map<String, dynamic>? data = docSnapshot.data();
  var value = data?['code'];

  return value;
}

void setAdminCode(String code) {
  FirebaseFirestore.instance
      .collection('adminCode')
      .doc("1")
      .update({'code': code});
}
