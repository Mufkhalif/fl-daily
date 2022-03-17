// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:klikdaily/data/store/list_fruits.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/presentation/pages/cart_page.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:klikdaily/utils/type_fruits.dart';

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

enum BottomNavItem { home, cart, account }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late final PageController pageController;

  BottomNavItem selectedBottomNavItem = BottomNavItem.home;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedBottomNavItem.index);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void switchBottomItem(BottomNavItem item) {
    if (item == selectedBottomNavItem) return;
    setState(() {
      selectedBottomNavItem = item;
      pageController.animateToPage(
        selectedBottomNavItem.index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: green,
          unselectedItemColor: Colors.grey,
          iconSize: 22,
          selectedLabelStyle: bold.copyWith(color: Colors.grey, fontSize: 12),
          unselectedLabelStyle: regular.copyWith(fontSize: 12),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Keranjang',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
        ),
        body: _selectedIndex == 0
            ? HomeTab()
            : _selectedIndex == 1
                ? CartTab()
                : Container());
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: listTabItem.length,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Image.asset(
                    'assets/images/onboarding_1.png',
                    width: 52,
                    height: 52,
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
                tabs: listTabItem.map((e) => Tab(text: e.name)).toList(),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: TabBarView(
                  children: listTabItem
                      .map((e) => ContainerListType(typeFruit: e.typeFruit))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerListType extends StatelessWidget {
  const ContainerListType({
    Key? key,
    required this.typeFruit,
  }) : super(key: key);

  final TypeFruit typeFruit;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      childAspectRatio: (1 / 1.3),
      shrinkWrap: true,
      children: _renderItems(),
    );
  }

  List<Widget> _renderItems() {
    List<Widget> items = [];

    final filterd =
        fruits.where((element) => element.typeFruit == typeFruit).toList();

    for (var i = 0; i < filterd.length; i++) {
      items.add(CardFruit(
        index: i,
        fruit: filterd[i],
      ));
    }

    return items;
  }
}

class CardFruit extends StatelessWidget {
  const CardFruit({
    Key? key,
    required this.fruit,
    required this.index,
  }) : super(key: key);

  final Fruit fruit;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isOdd = index % 2 == 0;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(
        left: isOdd ? 0 : 10,
        right: isOdd ? 10 : 0,
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
                borderRadius: BorderRadius.circular(12),
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
