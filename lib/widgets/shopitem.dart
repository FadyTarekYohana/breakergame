import 'package:flutter/material.dart';

import 'animatedbutton.dart';

class ShopItem extends StatelessWidget {
  final color;

  ShopItem(this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: color,
              width: 70,
              height: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: AnimatedButton(
            onPressed: () {},
            width: 70,
            height: 40,
            enabled: true,
            shadowDegree: ShadowDegree.dark,
            child: const Text(
              'BUY',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
