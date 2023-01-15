import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../widgets/animatedbutton.dart';

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
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              child: Text(
                'PLAY',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () => GoRouter.of(context).go('/levels'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              child: Text(
                'SHOP',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () => GoRouter.of(context).go('/shopscreen'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              child: Text(
                'OPTIONS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () => GoRouter.of(context).go('/optionsscreen'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
              child: Text(
                'CREDITS',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () => GoRouter.of(context).go('/creditsscreen'),
              enabled: true,
              shadowDegree: ShadowDegree.dark,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
                child: Text(
                  'LogOut',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AnimatedButton(
                child: Text(
                  'music',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  FlameAudio.play('assets/audio/audio.mp3');
                }),
          ),
        ],
      )),
    );
  }
}
