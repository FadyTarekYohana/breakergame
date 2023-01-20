import 'package:breakergame/data/coins_repository.dart';
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
  List<dynamic> colors = [];
  int coins = 0;

  loadData() async {
    var user = await getUser();
    setState(() {
      colors = user["colors"];
      coins = user["coins"];
      ref.read(coinsProvider.notifier).state = coins;
      ref.read(colorsProvider.notifier).state = colors;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ref.watch(colorsProvider);
    final coins = ref.watch(coinsProvider);
    final equippedColor = ref.watch(equippedColorProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 223, 59, 59),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
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
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    "COINS: $coins",
                    style: const TextStyle(
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
                        60,
                        equippedColor == Colors.black.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShopItem(
                        Colors.grey,
                        colors.contains(Colors.grey.toString()),
                        60,
                        equippedColor == Colors.grey.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShopItem(
                        Colors.white,
                        colors.contains(Colors.white.toString()),
                        60,
                        equippedColor == Colors.white.toString()),
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
                      60,
                      equippedColor == Colors.deepOrange.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                      Colors.orange,
                      colors.contains(Colors.orange.toString()),
                      60,
                      equippedColor == Colors.orange.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                      Colors.amber,
                      colors.contains(Colors.amber.toString()),
                      60,
                      equippedColor == Colors.amber.toString()),
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
                      60,
                      equippedColor == Colors.purple.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                      Colors.pink,
                      colors.contains(Colors.pink.toString()),
                      60,
                      equippedColor == Colors.pink.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(
                      Colors.cyan,
                      colors.contains(Colors.cyan.toString()),
                      60,
                      equippedColor == Colors.cyan.toString()),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "BUY A COLOR FOR 60 COINS",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Back('/homepage')),
          ])),
    );
  }
}
