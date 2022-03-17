import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/data/datasource/store/list_fruits.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/presentation/pages/detail_page.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:klikdaily/utils/extension.dart';
import 'package:klikdaily/utils/format_money.dart';
import 'package:klikdaily/utils/type_fruits.dart';

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
      childAspectRatio: (1 / 1.2),
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

    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, DetailPage.routeName, arguments: fruit),
      child: Container(
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
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 32),
                child: Hero(
                  tag: fruit.id,
                  child: Image.asset(
                    'assets/images/${fruit.assets}',
                    width: 72,
                    height: 72,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fruit.name,
                        style: bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Rp ${formatMoney(fruit.price)}/kg',
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
              child: GestureDetector(
                onTap: () =>
                    context.read<CartBloc>().add(AddFruitToCart(fruit)),
                child: Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerListAll extends StatelessWidget {
  const ContainerListAll({
    Key? key,
    required this.fruits,
  }) : super(key: key);

  final List<Fruit> fruits;

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

    for (var i = 0; i < fruits.length; i++) {
      items.add(CardFruit(
        index: i,
        fruit: fruits[i],
      ));
    }

    return items;
  }
}
