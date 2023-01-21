import 'package:audioplayers/audioplayers.dart';
import 'package:breakergame/data/music_repository.dart';
import 'package:breakergame/util/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/home_screen.dart';
import '../presentation/login_screen.dart';

class Authorize extends ConsumerWidget {
  const Authorize({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(musicProvider)) {
      getPlayer().play(AssetSource('audio/audio.mp3'));
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
