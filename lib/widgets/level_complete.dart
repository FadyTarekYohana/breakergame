import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LevelCompleteScreen extends StatelessWidget {
  const LevelCompleteScreen({super.key, required this.isLevelComplete});

  final bool isLevelComplete;

  @override
  Widget build(BuildContext context) {
    return isLevelComplete
        ? Container(
            alignment: Alignment(0, -0.3),
            child: Text("LEVEL COMPLETE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          )
        : Container();
  }
}
