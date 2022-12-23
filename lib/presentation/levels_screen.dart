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
              return ListView.builder(
                  itemCount: allLevels.length,
                  itemBuilder: ((context, index) {
                    return AnimatedButton(
                      onPressed: () => GoRouter.of(context)
                          .go('/gamescreen', extra: allLevels[index].id),
                      height: 30,
                      width: 50,
                      enabled: true,
                      shadowDegree: ShadowDegree.light,
                      child: Text(
                        'Level ${index + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }));
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


//  Column(
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(top: 50.0),
//               child: Text(
//                 "LEVELS",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20),
//               ),
//             ),
//             GridView.count(
//               shrinkWrap: true,
//               crossAxisCount: 5,
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 20,
//               children: List.generate(levels.length, (index) {
//                 var lvl = levels[index];
//                 return Center(
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: AnimatedButton(
//                           child: Text(
//                             ' ${index + 1}',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           onPressed: () => GoRouter.of(context)
//                               .go('/gamescreen', extra: lvl),
//                           height: 30,
//                           width: 50,
//                           enabled: true,
//                           shadowDegree: ShadowDegree.light,
//                         ),
//                       ),
//                       Expanded(
//                         child: TextButton(
//                           onPressed: () {
//                             // deleteLevel(lvl);
//                             // setState(() {
//                             //   levels.length;
//                             //   var lvl = levels[index];
//                             // });
//                           },
//                           child: const Text(
//                             "Delete",
//                             style: TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               }),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: AnimatedButton(
//                 child: Icon(Icons.add, color: Colors.white),
//                 onPressed: () => GoRouter.of(context).go('/levelbuilder'),
//                 width: 50,
//                 height: 50,
//                 enabled: true,
//                 shadowDegree: ShadowDegree.light,
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Back('/homepage')),
//           ],
//         )