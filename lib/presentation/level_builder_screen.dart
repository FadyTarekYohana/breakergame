import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/animatedbutton.dart';
import '../../widgets/backbutton.dart';
import '../../data/levels_repository.dart';
import '../domain/level.dart';

class LevelBuilder extends StatefulWidget {
  const LevelBuilder({super.key});

  @override
  State<LevelBuilder> createState() => _LevelBuilderState();
}

List<List<double>> bricks = [];
List<List<double>> barriers = [];
var items = [
  '0',
  '1',
  '2',
];
Map<double, String> dropdownvalue = {};

void removeFromList(List<List<double>> list, double i, double j) {
  const eq = ListEquality();
  final item = list.firstWhereOrNull(
    (element) => eq.equals(element, [i, j]),
  );
  item != null ? list.remove(item) : null;
}

void addToList(List<List<double>> list, double i, double j) {
  const eq = ListEquality();
  final item = list.firstWhereOrNull(
    (element) => eq.equals(element, [i, j]),
  );
  item == null ? list.add([i, j]) : null;
}

class _LevelBuilderState extends State<LevelBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "LEVEL BUILDER",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "CHOOSE 0 TO LEAVE AN EMPTY SPACE OR 1 FOR A BRICK OR 2 FOR A BARRIER",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            for (double i = -0.78; i < -0.08; i += 0.08)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (double j = -0.975; j < 1.3; j += 0.325)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DropdownButton(
                        dropdownColor: Colors.red,
                        value: dropdownvalue[i + j],
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue[i + j] = newValue!;
                            i = double.parse(i.toStringAsFixed(3));
                            j = double.parse(j.toStringAsFixed(3));

                            if (newValue == "1") {
                              addToList(bricks, i, j);
                              removeFromList(barriers, i, j);
                            } else if (newValue == "2") {
                              removeFromList(bricks, i, j);
                              addToList(barriers, i, j);
                            } else {
                              removeFromList(bricks, i, j);
                              removeFromList(barriers, i, j);
                            }
                          });
                        },
                      ),
                    ),
                ],
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Back('/levels')),
                AnimatedButton(
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    if (barriers.isNotEmpty || bricks.isNotEmpty) {
                      createLevel(bricks, barriers);
                      GoRouter.of(context).go('/levels');
                      bricks = [];
                      barriers = [];
                      dropdownvalue = {};
                    }
                  },
                  width: 80,
                  height: 50,
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
