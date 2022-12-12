import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:breakergame/routing/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.gif"),
            fit: BoxFit.cover),
      ),
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'EightBitDragon',
        ),
        debugShowCheckedModeBanner: false,
        title: "Brick Breaker",
        routerConfig: router,
      ),
    );
  }
}
