import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final double x;
  final double y;

  Barrier(this.x, this.y);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(x, y),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.25 / 2,
            color: Colors.grey,
          ),
        ));
  }
}
