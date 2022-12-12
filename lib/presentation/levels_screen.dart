import 'package:flutter/material.dart';
import 'package:breakergame/widgets/backbutton.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:breakergame/data/levels_repository.dart';
import '../../widgets/animatedbutton.dart';

class LevelsScreen extends ConsumerWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levels = ref.watch(levelsProvider);

    return Scaffold(
        backgroundColor: Colors.transparent,
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
                        child: AnimatedButton(
                          child: Text(
                            ' ${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () => GoRouter.of(context)
                              .go('/gamescreen', extra: lvl),
                          height: 30,
                          width: 50,
                          enabled: true,
                          shadowDegree: ShadowDegree.light,
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
              padding: const EdgeInsets.all(5.0),
              child: AnimatedButton(
                child: Icon(Icons.add, color: Colors.white),
                onPressed: () => GoRouter.of(context).go('/levelbuilder'),
                width: 50,
                height: 50,
                enabled: true,
                shadowDegree: ShadowDegree.light,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Back('/homepage')),
          ],
        ));
  }
}
