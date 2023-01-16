import 'package:breakergame/widgets/quote_of_the_day.dart';
import 'package:flutter/material.dart';
import 'package:breakergame/widgets/backbutton.dart';

class CreditsScreen extends StatelessWidget {
  const CreditsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "FADY TAREK",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "MOHAMED YASSER",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "ALYELDIN KHAIRY",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "AHMED HAMOUDA",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "HADY HANY",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(30.0), child: Back('/homepage')),
          ])),
    );
  }
}
