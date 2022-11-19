import 'dart:async';

import 'package:breakergame/widgets/ball.dart';
import 'package:breakergame/widgets/player.dart';
import 'package:breakergame/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
//ball variables
  double bx = 0;
  double by = 0;

  //player variables
  double playerX = 0;
  double playerWidth = 0.3;
  late Timer timer;
  //settings
  bool hasGameStarted = false;
  void startGame() {
    bool hasGameStarted = true;

    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
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
        if (details.delta.dx > 0) {
          movePlayerRight(
              details.delta.dx / (MediaQuery.of(context).size.width / 2.5));
        } else if (details.delta.dx < 0) {
          movePlayerLeft(
              details.delta.dx / (MediaQuery.of(context).size.width / 2.5));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Stack(
            //Tap to play
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[800]),
                  onPressed: () {
                    GoRouter.of(context).go('/homepage');
                    hasGameStarted = false;
                    timer.cancel();
                  },
                  child: const Text(
                    '<',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
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
