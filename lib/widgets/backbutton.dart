import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Back extends StatelessWidget {
  final path;

  Back(this.path);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red[800]),
      onPressed: () => GoRouter.of(context).go(path),
      child: const Text(
        '<',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
