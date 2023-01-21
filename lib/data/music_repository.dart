import 'package:audioplayers/audioplayers.dart';
import 'package:breakergame/util/user_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final player = AudioPlayer();
getPlayer() => player;

final musicProvider =
    StateProvider<bool>((ref) => UserSimplePreferences.getMusic());
