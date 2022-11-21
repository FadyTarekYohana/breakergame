import 'package:flutter/material.dart';
import 'package:breakergame/widgets/shopitem.dart';
import 'package:breakergame/widgets/backbutton.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
                    child: ShopItem(Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShopItem(Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShopItem(Colors.white),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(Colors.deepOrange),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(Colors.orange),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(Colors.amber),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(Colors.purple),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(Colors.pink),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ShopItem(Colors.blue),
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
