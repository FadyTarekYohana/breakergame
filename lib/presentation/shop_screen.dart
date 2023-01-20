import 'package:breakergame/data/colors_repository.dart';
import 'package:flutter/material.dart';
import 'package:breakergame/widgets/shopitem.dart';
import 'package:breakergame/widgets/backbutton.dart';
import 'package:breakergame/data/users_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends ConsumerState<ShopScreen> {
  late List<dynamic> colors;

  loadColors() async {
    var user = await getUser();
    setState(() {
      colors = user["colors"];
      ref.read(colorsProvider.notifier).state = colors;
    });
  }

  @override
  void initState() {
    loadColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(colorsProvider);

    return Scaffold(
      backgroundColor: Color.fromARGB(0, 223, 59, 59),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    "SHOP",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text(
                    "COINS: 0",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShopItem(
                      Colors.black,
                      colors.contains(Colors.black.toString()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShopItem(
                      Colors.grey,
                      colors.contains(Colors.grey.toString()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShopItem(
                      Colors.white,
                      colors.contains(Colors.white.toString()),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                    Colors.deepOrange,
                    colors.contains(Colors.deepOrange.toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                    Colors.orange,
                    colors.contains(Colors.orange.toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                    Colors.amber,
                    colors.contains(Colors.amber.toString()),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                    Colors.purple,
                    colors.contains(Colors.purple.toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                    Colors.pink,
                    colors.contains(Colors.pink.toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                    Colors.cyan,
                    colors.contains(Colors.cyan.toString()),
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Back('/homepage')),
          ])),
    );
  }
}
