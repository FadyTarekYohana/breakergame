import 'package:flutter/material.dart';

class MyPlayer extends StatelessWidget {
  final px;
  final pw;

  MyPlayer(this.px, this.pw);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment((2 * px + pw) / (2 - pw), 0.9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 10,
            width: MediaQuery.of(context).size.width * pw / 2,
            color: Colors.grey,
          ),
        ));
  }
}
