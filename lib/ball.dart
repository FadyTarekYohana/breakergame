import 'package:flutter/material.dart';

class myball extends StatelessWidget {
  final bx;
  final by;

  myball(this.bx, this.by);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      child: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
