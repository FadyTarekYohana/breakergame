import 'dart:async';
import 'dart:convert';

import 'package:breakergame/widgets/ball.dart';
import 'package:breakergame/widgets/barrier.dart';
import 'package:breakergame/widgets/brick.dart';
import 'package:breakergame/widgets/player.dart';
import 'package:breakergame/widgets/screen.dart';
import 'package:breakergame/widgets/levels/levelManager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameScreen extends StatefulWidget {
  final String level;
  const GameScreen({Key? key, required this.level}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var levelbarriers = [];
  var levelbricks = [];
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
        by += 0.005;
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

  loadList() async {
    var level = jsonDecode(await read(widget.level));
    setState(() {
      levelbricks = level[0];
      levelbarriers = level[1];
    });
  }

  @override
  void initState() {
    loadList();
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
        backgroundColor: Colors.red,
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
                    GoRouter.of(context).go('/levels');
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
              if (levelbricks.isNotEmpty)
                for (var item in levelbricks) Brick(item[1], item[0]),
              if (levelbarriers.isNotEmpty)
                for (var item in levelbarriers) Barrier(item[1], item[0]),
              myball(bx, by),
              MyPlayer(playerX, playerWidth)
            ],
          ),
        ),
      ),
    );
  }
}
