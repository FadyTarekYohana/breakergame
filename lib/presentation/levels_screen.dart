import 'package:breakergame/data/users_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/backbutton.dart';
import 'package:breakergame/data/levels_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:breakergame/widgets/animatedbutton.dart';
import '../domain/level.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  bool isAdmin = false;

  checkAdmin() async {
    var user = await getUser();
    if (user['type'] == 'admin') {
      setState(() {
        isAdmin = true;
      });
    }
  }

  @override
  void initState() {
    checkAdmin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<List<Level>>(
          stream: readLevels(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final allLevels = snapshot.data!.reversed.toList();
              return Stack(children: [
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "LEVELS",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 120.0,
                    bottom: 60.0,
                  ),
                  child: GridView.builder(
                    itemCount: allLevels.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: AnimatedButton(
                              onPressed: () => GoRouter.of(context).go(
                                  '/gamescreen',
                                  extra: allLevels[index].id),
                              height: 60,
                              width: 75,
                              enabled: true,
                              shadowDegree: ShadowDegree.dark,
                              child: Text(
                                'Level ${index + 1}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isAdmin,
                            child: AnimatedButton(
                              onPressed: () => deleteLevel(allLevels[index].id),
                              height: 35,
                              width: 55,
                              enabled: true,
                              shadowDegree: ShadowDegree.dark,
                              child: const Text(
                                'DELETE',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 150,
                    ),
                  ),
                ),
                Visibility(
                  visible: isAdmin,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: AnimatedButton(
                        onPressed: () =>
                            GoRouter.of(context).go('/levelbuilder'),
                        width: 50,
                        height: 50,
                        enabled: true,
                        shadowDegree: ShadowDegree.dark,
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Back('/homepage')),
                ),
              ]);
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isAdmin,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: AnimatedButton(
                          onPressed: () =>
                              GoRouter.of(context).go('/levelbuilder'),
                          width: 50,
                          height: 50,
                          enabled: true,
                          shadowDegree: ShadowDegree.dark,
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: Back('/homepage')),
                    const Text(
                      'THERE ARE NO LEVELS',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
