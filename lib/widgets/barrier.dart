import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double x;
  final double y;
  final double width;
  final double height;

  Barrier(this.width, this.height, this.x, this.y);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(x, y),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            height: MediaQuery.of(context).size.height * height / 2,
            width: MediaQuery.of(context).size.width * width / 2,
            color: Colors.grey,
          ),
        ));
  }
}
