import 'package:breakergame/data/users_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:breakergame/widgets/backbutton.dart';

import '../../widgets/animatedbutton.dart';
import '../widgets/quote_of_the_day.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  TextEditingController adminCodeController = TextEditingController();

  bool sound = true;
  bool music = true;
  var code = '';

  loadCode() async {
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
            Text(
              "CODE: $code",
              style: TextStyle(
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
                child: Text(
                  'CHANGE CODE',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () async {
                  setAdminCode(adminCodeController.text);
                  loadCode();
                },
                enabled: true,
                shadowDegree: ShadowDegree.light,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "SOUND",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                Switch(
                  value: sound,
                  onChanged: (value) {
                    setState(() {
                      sound = value;
                    });
                  },
                  activeTrackColor: Color.fromARGB(255, 126, 25, 18),
                  activeColor: Color.fromARGB(255, 255, 0, 0),
                )
              ],
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
                        fontSize: 30),
                  ),
                ),
                Switch(
                  value: music,
                  onChanged: (value) {
                    setState(() {
                      music = value;
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
                child: Text(
                  'LOG OUT',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  GoRouter.of(context).go('/');
                },
                enabled: true,
                shadowDegree: ShadowDegree.light,
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
