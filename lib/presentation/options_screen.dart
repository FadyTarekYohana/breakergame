import 'package:breakergame/data/users_repository.dart';
import 'package:breakergame/util/user_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:breakergame/widgets/backbutton.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../widgets/animatedbutton.dart';
import '../widgets/quote_of_the_day.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  TextEditingController adminCodeController = TextEditingController();
  final player = AudioPlayer();
  bool music = true;
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
                  onChanged: (value) {
                    setState(() {
                      music = value;
                      if (music == true) {
                        player.play(AssetSource('audio/audio.mp3'));
                      } else {
                        player.stop();
                      }
                    });
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
            QuoteOfTheDay(),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Back('/homepage')),
          ])),
    );
  }
}
