import 'package:flutter/material.dart';
import 'package:breakergame/widgets/backbutton.dart';

import 'package:breakergame/data/users_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/level.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late dynamic user;

  bool loaded = false;

  GetUser() async {
    user = await getUser();
    setState(() {
      if (user != null) {
        loaded = true;
      }
    });
  }

  @override
  void initState() {
    GetUser();
    super.initState();
  }
//hello hamouda
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Email:",
                        style: TextStyle(
                            // shadows: [
                            //   Shadow(
                            //     color: Colors.red,
                            //     offset: Offset(3.4, 3.4),
                            //   ),
                            // ],
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "${loaded ? user['email'] : "Loading user info..."}",
                        style: TextStyle(
                            // shadows: [
                            //   Shadow(
                            //     color: Colors.red,
                            //     offset: Offset(3.4, 3.4),
                            //   ),
                            // ],
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        "Coins:",
                        style: TextStyle(
                            // shadows: [
                            //   Shadow(
                            //     color: Colors.red,
                            //     offset: Offset(3.4, 3.4),
                            //   ),
                            // ],
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "${loaded ? user['coins'] : "Loading user info..."}",
                        style: TextStyle(
                            // shadows: [
                            //   Shadow(
                            //     color: Colors.red,
                            //     offset: Offset(3.4, 3.4),
                            //   ),
                            // ],
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Align(
                    alignment: Alignment.bottomRight, child: Back('/homepage')),
              ),
            ])));
  }
}
