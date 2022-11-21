import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:breakergame/widgets/backbutton.dart';
import 'package:go_router/go_router.dart';
import 'package:breakergame/widgets/levels/levelManager.dart';
import 'package:path_provider/path_provider.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({Key? key}) : super(key: key);

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  void updateLevelList() {
    setState(() {});
  }

  @override
  void initState() {
    updateLevelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    updateLevelList();
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                "LEVELS",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 5,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: List.generate(levels.length, (index) {
                var lvl = levels[index];
                return Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[800]),
                          onPressed: () => GoRouter.of(context)
                              .go('/gamescreen', extra: lvl),
                          child: Text(' ${index + 1}'),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // deleteLevel(lvl);
                            // setState(() {
                            //   levels.length;
                            //   var lvl = levels[index];
                            // });
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.red[800]),
                onPressed: () => GoRouter.of(context).go('/levelbuilder'),
                child: const Text(
                  '+',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Back('/homepage')),
          ],
        ));
  }
}
