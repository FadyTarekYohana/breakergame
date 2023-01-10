import 'dart:async';
import 'dart:math';

import 'package:breakergame/widgets/backbutton.dart';
import 'package:breakergame/widgets/ball.dart';
import 'package:breakergame/widgets/barrier.dart';
import 'package:breakergame/widgets/brick.dart';
import 'package:breakergame/widgets/game_over.dart';
import 'package:breakergame/widgets/level_complete.dart';
import 'package:breakergame/widgets/player.dart';
import 'package:breakergame/widgets/game_start.dart';
import 'package:breakergame/data/levels_repository.dart';
import 'package:breakergame/widgets/powerups/increase_size.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/animatedbutton.dart';

class GameScreen extends StatefulWidget {
  final String level;
  const GameScreen({Key? key, required this.level}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

enum direction { UP, DOWN, LEFT, RIGHT }

class _GameScreenState extends State<GameScreen> {
  List<dynamic> bricksx = [],
      bricksy = [],
      barriersx = [],
      barriersy = [],
      broken = [];

  double ballX = 0;
  double ballY = 0;
  double ballXmovement = 0.02;
  double ballYmovement = 0.02;

  double powerUpX = 0;
  double powerUpY = 0;
  bool dropPowerUp = false;

  var ballXDirection = direction.DOWN;
  var ballYDirection = direction.DOWN;

  double brickWidth = 0.25;
  double brickHeight = 0.05;

  double barrierWidth = 0.25;
  double barrierHeight = 0.05;

  double playerWidth = 0.3;
  double playerX = -0.15;

  late Timer timer;

  bool levelComplete = false;
  bool hasGameStarted = false;
  bool isGameOver = false;

  void gameLoop() {
    if (hasGameStarted == false) {
      hasGameStarted = true;

      timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        updateDirection();
        moveBall();
        movePowerUp();
        if (isPlayerDead()) {
          timer.cancel();
          isGameOver = true;
        }
        if (isLevelComplete()) {
          timer.cancel();
          levelComplete = true;
        }
        if (barriersx.isNotEmpty) checkForBarriers();
        checkForBrokenBricks();
      });
    }
  }

  bool isLevelComplete() {
    if (broken.every((element) => element == true)) {
      return true;
    }
    return false;
  }

  void checkForBarriers() {
    for (int i = 0; i < barriersx.length; i++) {
      if (ballX >= barriersx[i] &&
          ballX <= barriersx[i] + barrierWidth &&
          ballY >= barriersy[i] &&
          ballY <= barriersy[i] + barrierHeight) {
        setState(() {
          double leftSideDist = (barriersx[i] - ballX).abs();
          double rightSideDist = (barriersx[i] + barrierWidth - ballX).abs();
          double topSideDist = (barriersy[i] - ballY).abs();
          double bottomSideDist = (barriersy[i] + barrierHeight - ballY).abs();

          String min =
              findMin(leftSideDist, rightSideDist, topSideDist, bottomSideDist);

          switch (min) {
            case 'left':
              ballXDirection = direction.LEFT;
              break;
            case 'right':
              ballXDirection = direction.RIGHT;
              break;
            case 'top':
              ballYDirection = direction.UP;
              break;
            case 'bottom':
              ballYDirection = direction.DOWN;
              break;
            default:
          }
        });
      }
    }
  }

  void checkPowerUp(double x, double y) {
    var chance = Random().nextInt(100);
    if (chance > 25) {
      setState(() {
        dropPowerUp = true;
        powerUpX = x;
        powerUpY = y;
      });
    }
  }

  void checkForBrokenBricks() {
    for (int i = 0; i < bricksx.length; i++) {
      if (ballX >= bricksx[i] &&
          ballX <= bricksx[i] + brickWidth &&
          ballY >= bricksy[i] &&
          ballY <= bricksy[i] + brickHeight &&
          broken[i] == false) {
        if (!dropPowerUp) checkPowerUp(bricksx[i], bricksy[i]);
        setState(() {
          broken[i] = true;
          double leftSideDist = (bricksx[i] - ballX).abs();
          double rightSideDist = (bricksx[i] + brickWidth - ballX).abs();
          double topSideDist = (bricksy[i] - ballY).abs();
          double bottomSideDist = (bricksy[i] + brickHeight - ballY).abs();

          String min =
              findMin(leftSideDist, rightSideDist, topSideDist, bottomSideDist);

          switch (min) {
            case 'left':
              ballXDirection = direction.LEFT;
              break;
            case 'right':
              ballXDirection = direction.RIGHT;
              break;
            case 'top':
              ballYDirection = direction.UP;
              break;
            case 'bottom':
              ballYDirection = direction.DOWN;
              break;
            default:
          }
        });
      }
    }
  }

  String findMin(double a, double b, double c, double d) {
    List<double> list = [a, b, c, d];
    double min = a;

    for (int i = 0; i < list.length; i++) {
      if (list[i] < min) {
        min = list[i];
      }
    }

    if ((min - a).abs() < 0.01) {
      return 'left';
    } else if ((min - b).abs() < 0.01) {
      return 'right';
    } else if ((min - c).abs() < 0.01) {
      return 'top';
    } else if ((min - d).abs() < 0.01) {
      return 'bottom';
    }

    return '';
  }

  bool isPlayerDead() {
    if (ballY >= 1) {
      return true;
    }

    return false;
  }

  void updateDirection() {
    setState(() {
      double leftSideDist = (playerX - ballX).abs();
      double rightSideDist = (playerX + playerWidth - ballX).abs();
      if (ballY >= 0.9 && ballX >= playerX && ballX <= playerX + playerWidth) {
        ballYDirection = direction.UP;
        String min = findMin(leftSideDist, rightSideDist, 1000, 1000);
        switch (min) {
          case 'left':
            ballXDirection = direction.LEFT;
            break;
          case 'right':
            ballXDirection = direction.RIGHT;
            break;
          default:
        }
      } else if (ballY <= -0.82) {
        ballYDirection = direction.DOWN;
      }

      if (ballX >= 1) {
        ballXDirection = direction.LEFT;
      } else if (ballX <= -1) {
        ballXDirection = direction.RIGHT;
      }
    });
  }

  void movePowerUp() {
    setState(() {
      if (dropPowerUp) {
        powerUpY += 0.005;
      }
      if (powerUpY >= 1) {
        dropPowerUp = false;
      }
      if (powerUpY >= 0.9 &&
          powerUpX >= playerX &&
          powerUpX <= playerX + playerWidth) {
        dropPowerUp = false;
        powerUpX = 0;
        powerUpY = 0;
        if (playerWidth <= 1.1) playerWidth *= 1.5;
      }
    });
  }

  void moveBall() {
    setState(() {
      if (ballXDirection == direction.LEFT) {
        ballX -= ballXmovement;
      } else if (ballXDirection == direction.RIGHT) {
        ballX += ballXmovement;
      }

      if (ballYDirection == direction.DOWN) {
        ballY += ballYmovement;
      } else if (ballYDirection == direction.UP) {
        ballY -= ballYmovement;
      }
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

  void loadLevel() async {
    final levelData = await readLevel(widget.level);
    setState(() {
      bricksx = levelData!["bricksx"];
      bricksy = levelData["bricksy"];
      barriersx = levelData["barriersx"];
      barriersy = levelData["barriersy"];
      broken = List.filled(bricksx.length, false);
    });
  }

  void resetGame() {
    setState(() {
      broken = List.filled(bricksx.length, false);
      dropPowerUp = false;
      ballX = 0;
      ballY = 0;
      isGameOver = false;
      hasGameStarted = false;
      levelComplete = false;
      ballXDirection = direction.DOWN;
      ballYDirection = direction.DOWN;
      playerX = -0.15;
      playerWidth = 0.3;
    });
  }

  @override
  void initState() {
    loadLevel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameLoop,
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
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: AnimatedButton(
                  child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                  onPressed: () {
                    broken.forEach((element) {
                      element = false;
                    });
                    GoRouter.of(context).go('/levels');
                  },
                  width: 50,
                  height: 50,
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                ),
              ),
              LevelCompleteScreen(isLevelComplete: levelComplete),
              IncreaseSize(powerUpX, powerUpY, dropPowerUp),
              GameStartScreen(hasGameStarted: hasGameStarted),
              GameOverScreen(
                isGameOver: isGameOver,
                function: resetGame,
              ),
              for (int i = 0; i < bricksx.length; i++)
                Brick(
                    brickWidth, brickHeight, bricksx[i], bricksy[i], broken[i]),
              for (int i = 0; i < barriersx.length; i++)
                Barrier(
                    barrierWidth, barrierHeight, barriersx[i], barriersy[i]),
              myball(
                ballX,
                ballY,
              ),
              MyPlayer(playerX, playerWidth)
            ],
          ),
        ),
      ),
    );
  }
}
