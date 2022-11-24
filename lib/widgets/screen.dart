import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final bool hasGameStarted;

  Screen({required this.hasGameStarted});

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
