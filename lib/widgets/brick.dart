import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  final double width;
  final double height;
  final double x;
  final double y;
  final bool broken;

  const Brick(this.width, this.height, this.x, this.y, this.broken,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return broken
        ? Container()
        : Container(
            alignment: Alignment(x, y),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: MediaQuery.of(context).size.height * height / 2,
                width: MediaQuery.of(context).size.width * width / 2,
                color: Colors.white,
              ),
            ));
  }
}
