import 'package:flutter/material.dart';

class GameStartScreen extends StatelessWidget {
  final bool hasGameStarted;

  GameStartScreen({required this.hasGameStarted});

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
        ? Container()
        : Container(
            alignment: const Alignment(0, 0.5),
            child: const Text(
              'Tap The Screen To Start',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );
  }
}
