import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final bool hasGameStarted;

  Screen({required this.hasGameStarted});

  @override
  Widget build(BuildContext context) {
    return hasGameStarted
        ? Container()
        : Container(
            alignment: Alignment(0, -0.4),
            child: Text(
              'Tap The Screen To Start',
              style: TextStyle(color: Colors.blue[300]),
            ),
          );
  }
}
