import 'dart:async';

import 'package:breakergame/ball.dart';
import 'package:breakergame/screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//ball variables
  double bx = 0;
  double by = 0;
  //settings
  bool hasGameStarted = false;
  void startGame() {
    bool hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        by -= 0.01;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Stack(
          //Tap to play
          children: [
            Screen(hasGameStarted: hasGameStarted),
            //ball
            myball(bx, by)
          ],
        ),
      ),
    );
  }
}
