import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  final double x;
  final double y;
  final bool broken = false;

  Brick(this.x, this.y);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(x, y),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.25 / 2,
            color: Colors.white,
          ),
        ));
  }
}
