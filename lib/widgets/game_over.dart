import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({super.key, required this.isGameOver});

  final bool isGameOver;

  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Container(
            alignment: Alignment(0, -0.3),
            child: Text("GAME OVER",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          )
        : Container();
  }
}
