import 'dart:async';

import 'package:breakergame/ball.dart';
import 'package:breakergame/player.dart';
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

  //player variables
  double playerX = 0;
  double playerWidth = 0.3;
  //settings
  bool hasGameStarted = false;
  void startGame() {
    bool hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        by += 0.001;
      });
    });
  }

  void movePlayerLeft(double delta) {
    if (!(playerX - delta.abs() < -1)) {
      playerX -= delta.abs();
    }
  }

  void movePlayerRight(double delta) {
    if (!(playerX + playerWidth + delta.abs() > 1)) {
      playerX += delta.abs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      onHorizontalDragUpdate: (details) {
        int sensitivity = 4;

        if (details.delta.dx > sensitivity) {
          movePlayerRight(
              details.delta.dx / (MediaQuery.of(context).size.width / 2.5));
        } else if (details.delta.dx < -sensitivity) {
          movePlayerLeft(
              details.delta.dx / (MediaQuery.of(context).size.width / 2.5));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: Stack(
            //Tap to play
            children: [
              Screen(hasGameStarted: hasGameStarted),
              //ball
              myball(bx, by),

              //player
              MyPlayer(playerX, playerWidth)
            ],
          ),
        ),
      ),
    );
  }
}
