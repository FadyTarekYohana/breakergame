import 'package:breakergame/data/music_repository.dart';
import 'package:breakergame/data/users_repository.dart';
import 'package:breakergame/util/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:breakergame/widgets/backbutton.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../widgets/animatedbutton.dart';

class OptionsScreen extends ConsumerStatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  OptionsScreenState createState() => OptionsScreenState();
}

class OptionsScreenState extends ConsumerState<OptionsScreen> {
  TextEditingController adminCodeController = TextEditingController();

  bool isAdmin = false;
  var code = '';

  loadCode() async {
    var user = await getUser();

    if (user['type'] == 'admin') {
      setState(() {
        isAdmin = true;
      });
    }
    code = await getAdminCode();
    setState(() {
      ref.read(musicProvider.notifier).state = UserSimplePreferences.getMusic();
      code;
    });
  }

  @override
  void initState() {
    loadCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final music = ref.watch(musicProvider);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Visibility(
              visible: isAdmin,
              child: Column(
                children: [
                  Text(
                    "CODE: $code",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    controller: adminCodeController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'CASE SENSITIVE CODE',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'CODE CAN\'T BE EMPTY';
                      } else {
                        return null;
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AnimatedButton(
                      onPressed: () async {
                        setAdminCode(adminCodeController.text);
                        loadCode();
                      },
                      enabled: true,
                      shadowDegree: ShadowDegree.dark,
                      child: const Text(
                        'CHANGE CODE',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "MUSIC",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Switch(
                  value: music,
                  onChanged: (value) async {
                    if (value) {
                      await UserSimplePreferences.setMusic(value);
                      ref.read(musicProvider.state).state =
                          UserSimplePreferences.getMusic();

                      getPlayer().play(AssetSource('audio/audio.mp3'));
                    } else {
                      await UserSimplePreferences.setMusic(value);
                      ref.read(musicProvider.state).state =
                          UserSimplePreferences.getMusic();

                      getPlayer().stop();
                    }
                  },
                  activeTrackColor: const Color.fromARGB(255, 126, 25, 18),
                  activeColor: const Color.fromARGB(255, 255, 0, 0),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AnimatedButton(
                onPressed: () async {
                  await UserSimplePreferences.clear();
                  await FirebaseAuth.instance.signOut();
                  GoRouter.of(context).go('/');
                },
                enabled: true,
                shadowDegree: ShadowDegree.dark,
                child: const Text(
                  'LOG OUT',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Back('/homepage')),
          ])),
    );
  }
}
