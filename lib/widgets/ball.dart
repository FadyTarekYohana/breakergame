import 'package:breakergame/util/color_from_string.dart';
import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final double bx;
  final double by;
  final double width;
  final double height;

  const Ball(this.bx, this.by, this.width, this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(bx, by),
      child: Container(
        height: MediaQuery.of(context).size.height * height / 2,
        width: MediaQuery.of(context).size.width * width / 2,
        decoration: BoxDecoration(
          color: equippedColorFromString(),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
