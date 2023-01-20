import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/colors_repository.dart';
import '../data/users_repository.dart';
import '../presentation/shop_screen.dart';
import 'animatedbutton.dart';

class ShopItem extends ConsumerStatefulWidget {
  final shopcolor;
  final bought;

  ShopItem(this.shopcolor, this.bought);

  @override
  ShopItemState createState() => ShopItemState();
}

class ShopItemState extends ConsumerState<ShopItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: widget.shopcolor,
              width: 70,
              height: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Visibility(
            visible: widget.bought,
            replacement: AnimatedButton(
              onPressed: () {
                ref
                    .read(colorsProvider.notifier)
                    .addToColors(widget.shopcolor.toString());
                setColors(ref.read(colorsProvider));
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
              onPressed: () {},
              width: 70,
              height: 40,
              enabled: true,
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
