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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<List<Level>>(
          stream: readLevels(),
          builder: (context, snapshot) {
            print(
                '#################################################\n###########################################');
            print(snapshot.data);
            print(
                '#################################################\n###########################################');
            if (snapshot.hasData) {
              final allLevels = snapshot.data!;
              return Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "LEVELS",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                GridView.builder(
                  itemCount: allLevels.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: AnimatedButton(
                        onPressed: () => GoRouter.of(context)
                            .go('/gamescreen', extra: allLevels[index].id),
                        height: 50,
                        width: 85,
                        enabled: true,
                        shadowDegree: ShadowDegree.light,
                        child: Text(
                          'Level ${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.7,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: AnimatedButton(
                      onPressed: () => GoRouter.of(context).go('/levelbuilder'),
                      width: 50,
                      height: 50,
                      enabled: true,
                      shadowDegree: ShadowDegree.light,
                      child: const Icon(Icons.add, color: Colors.white),
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
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: AnimatedButton(
                        onPressed: () =>
                            GoRouter.of(context).go('/levelbuilder'),
                        width: 50,
                        height: 50,
                        enabled: true,
                        shadowDegree: ShadowDegree.light,
                        child: const Icon(Icons.add, color: Colors.white),
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
