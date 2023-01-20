import 'package:breakergame/data/coins_repository.dart';
import 'package:breakergame/util/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/colors_repository.dart';
import 'animatedbutton.dart';

class ShopItem extends ConsumerWidget {
  final Color shopcolor;
  final bool bought;
  final int price;
  final bool equipped;

  const ShopItem(this.shopcolor, this.bought, this.price, this.equipped,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: shopcolor,
              width: 70,
              height: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Visibility(
            visible: bought,
            replacement: AnimatedButton(
              onPressed: () {
                if (ref.read(coinsProvider) >= price) {
                  ref.read(coinsProvider.notifier).buy(price);
                  setCoins(ref.read(coinsProvider));
                  ref
                      .read(colorsProvider.notifier)
                      .addToColors(shopcolor.toString());
                  setColors(ref.read(colorsProvider));
                }
              },
              width: 70,
              height: 40,
              enabled: true,
              shadowDegree: ShadowDegree.dark,
              child: const Text(
                'BUY',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            child: AnimatedButton(
              onPressed: () {
                UserSimplePreferences.setEquippedColor(shopcolor.toString());
                ref.read(equippedColorProvider.state).state =
                    shopcolor.toString();
              },
              width: 70,
              height: 40,
              enabled: !equipped,
              shadowDegree: ShadowDegree.dark,
              child: const Text(
                'EQUIP',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
