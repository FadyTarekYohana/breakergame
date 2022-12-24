import 'dart:async';
import 'dart:convert';

import 'package:breakergame/widgets/backbutton.dart';
import 'package:breakergame/widgets/ball.dart';
import 'package:breakergame/widgets/barrier.dart';
import 'package:breakergame/widgets/brick.dart';
import 'package:breakergame/widgets/player.dart';
import 'package:breakergame/widgets/screen.dart';
import 'package:breakergame/data/levels_repository.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String level;
  const GameScreen({Key? key, required this.level}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<List<double>> levelbarriers = [
    [-0.325, -0.38]
  ];
  final List<List<double>> levelbricks = [
    [-0.65, -0.62]
  ];
  List<dynamic> bricksx = [], bricksy = [], barriersx = [], barriersy = [];

  double bx = 0;
  double by = 0.2;

  double playerWidth = 0.3;
  double playerX = -0.15;

  late Timer timer;

  bool hasGameStarted = false;
  void startGame() {
    bool hasGameStarted = true;

    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        by -= 0.007;
      });
    });
  }

  void movePlayerLeft(double delta) {
    if (!(playerX - delta.abs() < -1)) {
      playerX -= delta.abs();
    }
  }

  void movePlayerRight(double delta) {
    print(barriersx);
    if (!(playerX + playerWidth + delta.abs() > 1)) {
      playerX += delta.abs();
    }
  }

  void loadLevel() async {
    final levelData = await readLevel(widget.level);
    setState(() {
      bricksx = levelData!["bricksx"];
      bricksy = levelData!["bricksy"];
      barriersx = levelData!["barriersx"];
      barriersy = levelData!["barriersy"];
    });

    print(barriersx);
  }

  @override
  void initState() {
    print(barriersx);
    loadLevel();
    print(barriersx);
    super.initState();
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
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            //Tap to play
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Back('/levels')),
              Screen(hasGameStarted: hasGameStarted),
              for (int i = 0; i < bricksx.length; i++)
                Brick(bricksx[i], bricksy[i]),
              for (int i = 0; i < barriersx.length; i++)
                Barrier(barriersx[i], barriersy[i]),
              myball(bx, by),
              MyPlayer(playerX, playerWidth)
            ],
          ),
        ),
      ),
    );
  }
}
