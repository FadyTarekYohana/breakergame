import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'animatedbutton.dart';

class Back extends StatelessWidget {
  final path;

  Back(this.path);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: AnimatedButton(
        child: Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: () => GoRouter.of(context).go(path),
        width: 50,
        height: 50,
        enabled: true,
        shadowDegree: ShadowDegree.dark,
      ),
    );
  }
}
