// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:klikdaily/utils/format_money.dart';
import 'package:klikdaily/widgets/modals/snackbar_confirm.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  void initState() {
    super.initState();

    context.read<CartBloc>().add(FetchingFruitToCart());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 62,
                ),
                Text(
                  'Keranjang',
                  style: bold.copyWith(fontSize: 22),
                ),
                Expanded(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      final filterd = state.fruits
                          .where((element) => element.totalItems != 0)
                          .toList();

                      if (filterd.isEmpty) {
                        return Center(
                          child: Text(
                            'Belum ada item dikeranjang',
                            style: regular,
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: filterd.length,
                        itemBuilder: ((BuildContext context, int index) {
                          return _renderItem(filterd[index]);
                        }),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              var totalItem = 0;
              var totalPrice = 0;

              for (var item in state.fruits) {
                if (item.totalItems != 0) {
                  totalItem += item.totalItems;
                  totalPrice += item.totalItems * item.price;
                }
              }

              if (totalPrice == 0 && totalItem == 0) {
                return Container();
              }

              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Total Item: $totalItem',
                            style: regular.copyWith(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: orange,
                              decorationThickness: 4,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp ${formatMoney(totalPrice)}',
                            style: bold.copyWith(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        'Bayar',
                        style: bold.copyWith(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _renderItem(Fruit fruit) => Container(
        margin: EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Image.asset(
              'assets/images/${fruit.assets}',
              width: 62,
              height: 62,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fruit.name,
                  style: bold.copyWith(fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  'Rp ${formatMoney(fruit.price)}/kg',
                  style: regular.copyWith(fontSize: 14, color: orange),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () => fruit.totalItems == 1
                  ? showDialogConfirm(
                      context: context,
                      title: fruit.name,
                      onConfirm: () {
                        context.read<CartBloc>().add(RemoveFruitToCart(fruit));
                      },
                    )
                  : context.read<CartBloc>().add(RemoveFruitToCart(fruit)),
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.remove,
                  color: green,
                  size: 22,
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              fruit.totalItems.toString(),
              style: bold.copyWith(fontSize: 14),
            ),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () =>
                  context.read<CartBloc>()..add(AddFromListFruitToCart(fruit)),
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  // color: green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  Icons.add,
                  color: green,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      );
}
