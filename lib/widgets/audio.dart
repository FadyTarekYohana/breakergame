import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AssetsAudioPlayer _assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer();
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/audios/music.mp3"),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Asset Audio Example'),
        ),
        body: Container(),
      ),
    );
  }
}
