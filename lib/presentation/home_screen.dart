import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/animatedbutton.dart';
import '../widgets/quote_of_the_day.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "BRICK BREAKER",
              textAlign: TextAlign.center,
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.red,
                      offset: Offset(3.4, 3.4),
                    ),
                  ],
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 5, right: 5),
            child: QuoteOfTheDay(),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              onPressed: () => GoRouter.of(context).go('/levels'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
              child: const Text(
                'PLAY',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              onPressed: () => GoRouter.of(context).go('/shopscreen'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
              child: const Text(
                'SHOP',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              onPressed: () => GoRouter.of(context).go('/optionsscreen'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
              child: const Text(
                'OPTIONS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              onPressed: () => GoRouter.of(context).go('/creditsscreen'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
              child: const Text(
                'CREDITS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              onPressed: () => GoRouter.of(context).go('/profilescreen'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
              child: const Text(
                'PROFILE',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
