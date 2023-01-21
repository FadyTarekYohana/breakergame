import 'package:breakergame/util/color_from_string.dart';
import 'package:flutter/material.dart';

class myball extends StatelessWidget {
  final bx;
  final by;

  myball(
    this.bx,
    this.by,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(bx, by),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: equippedColorFromString(),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
