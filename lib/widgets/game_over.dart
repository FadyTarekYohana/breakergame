import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class GameOverScreen extends StatelessWidget {
  final bool isGameOver;
  final function;

  //font
  static var gameFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(
          color: Colors.deepPurple[600], letterSpacing: 0, fontSize: 28));

  GameOverScreen({super.key, required this.isGameOver, this.function});

  @override
  Widget build(BuildContext context) {
    return isGameOver
        ? Stack(
            children: [
              Container(
                alignment: Alignment(0, -0.3),
                child: Text(
                  "GAME OVER",
                  style: gameFont,
                ),
              ),
              Container(
                  alignment: Alignment(0, 0),
                  child: GestureDetector(
                      onTap: function,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.deepPurple,
                          child: Text(
                            'Play Again',
                            style: gameFont,
                          ),
                        ),
                      )))
            ],
          )
        : Container();
  }
}
