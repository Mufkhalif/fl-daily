// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:klikdaily/data/store/list_fruits.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/themes/theme.dart';

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> dummy = [
  "Kentang",
  "Kubis",
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 42,
              ),
              Row(
                children: [
                  Text(
                    'Find',
                    style: bold.copyWith(color: yellow, fontSize: 22),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Fresh Groceries',
                    style: bold.copyWith(color: green, fontSize: 22),
                  ),
                  Spacer(),
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32),
                    ),
                  )
                ],
              ),
              Text(
                'Dengan kondisi dan harga terbaik',
                style: regular.copyWith(
                    fontSize: 14, color: dark.withOpacity(0.5)),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: dark.withOpacity(0.5)),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Cari sayuran ...',
                      style: regular.copyWith(
                          fontSize: 14, color: dark.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ButtonsTabBar(
                height: 42,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: green,
                  border: Border.all(color: green, width: 2),
                  borderRadius: BorderRadius.circular(34),
                ),
                unselectedDecoration: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(
                    34,
                  ),
                ),
                labelStyle: bold.copyWith(color: Colors.white),
                unselectedLabelStyle: regular.copyWith(color: dark),
                radius: 32,
                onTap: (p0) => null,
                tabs: [
                  Tab(
                    text: 'Favorite',
                  ),
                  Tab(
                    text: 'Sawi',
                  ),
                  Tab(
                    text: 'Kubis',
                  ),
                  Tab(
                    text: 'Tomat',
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        childAspectRatio: (1 / 1.3),
                        shrinkWrap: true,
                        children: _renderItems(),
                      ),
                    ),
                    Container(
                      child: Text('asd'),
                    ),
                    Container(
                      child: Text('asd'),
                    ),
                    Container(
                      child: Text('asd'),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  List<Widget> _renderItems() {
    List<Widget> items = [];

    for (var i = 0; i < fruits.length; i++) {
      items.add(CardFruit(
        fruit: fruits[i],
      ));
    }

    return items;
  }
}

class CardFruit extends StatelessWidget {
  const CardFruit({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    final isOdd = fruit.id % 2 == 0;

    print(isOdd);

    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(
        left: isOdd ? 10 : 0,
        right: isOdd ? 0 : 10,
        bottom: 14,
      ),
      height: 140,
      decoration: BoxDecoration(
        color: fruit.bgColor.toColor(),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/${fruit.assets}',
              width: 72,
              height: 72,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fruit.name,
                      style: bold,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Rp. ${fruit.price}/kg',
                      style: regular.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
