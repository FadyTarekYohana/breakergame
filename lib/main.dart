import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:breakergame/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'EightBitDragon',
      ),
      debugShowCheckedModeBanner: false,
      title: "Brick Breaker",
      routerConfig: router,
    );
  }
}
