import 'package:breakergame/data/coins_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LevelCompleteScreen extends ConsumerWidget {
  const LevelCompleteScreen(this.function,
      {super.key, required this.isLevelComplete});

  final bool isLevelComplete;
  final function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isLevelComplete
        ? Stack(children: [
            Container(
              alignment: const Alignment(0, -0.3),
              child: const Text("LEVEL COMPLETED!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
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
          ])
        : Container();
  }
}
