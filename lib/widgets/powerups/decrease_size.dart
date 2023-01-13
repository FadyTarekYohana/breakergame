import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DecreaseSize extends StatelessWidget {
  final double x;
  final double y;
  final bool dropped;

  DecreaseSize(this.x, this.y, this.dropped);

  @override
  Widget build(BuildContext context) {
    return dropped
        ? Container(
            alignment: Alignment(x, y),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 25,
                  height: 25,
                  color: Colors.red,
                  child: const Icon(
                    Icons.keyboard_double_arrow_down,
                    color: Colors.white,
                  ),
                )))
        : Container();
  }
}
