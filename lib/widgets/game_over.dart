import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final bool isGameOver;
  final function;

  const GameOverScreen({super.key, required this.isGameOver, this.function});

  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Stack(
            children: [
              Container(
                alignment: const Alignment(0, -0.3),
                child: const Text(
                  "GAME OVER",
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 0, fontSize: 28),
                ),
              ),
              Container(
                  alignment: const Alignment(0, 0),
                  child: GestureDetector(
                      onTap: function,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.red,
                          child: const Text(
                            'PLAY AGAIN',
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 0,
                                fontSize: 28),
                          ),
                        ),
                      )))
            ],
          )
        : Container();
  }
}
