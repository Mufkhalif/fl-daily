import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/presentation/pages/success_page.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:klikdaily/utils/format_money.dart';
import 'package:klikdaily/widgets/modals/snackbar_confirm.dart';
import 'package:lottie/lottie.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
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
                        return Container(
                          margin: const EdgeInsets.only(top: 100),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  'assets/animation/empty-state.json',
                                  width: 300,
                                ),
                                Text(
                                  'Belum ada item dikeranjang',
                                  style: regular,
                                )
                              ],
                            ),
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
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: green,
                    borderRadius: const BorderRadius.only(
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
                          const SizedBox(height: 8),
                          Text(
                            'Rp ${formatMoney(totalPrice)}',
                            style: bold.copyWith(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, SuccesPage.routeName),
                        child: Text(
                          'Bayar',
                          style:
                              bold.copyWith(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 12),
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
        margin: const EdgeInsets.only(bottom: 24),
        child: Row(
          children: [
            Image.asset(
              'assets/images/${fruit.assets}',
              width: 62,
              height: 62,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fruit.name,
                  style: bold.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  'Rp ${formatMoney(fruit.price)}/kg',
                  style: regular.copyWith(fontSize: 14, color: orange),
                ),
              ],
            ),
            const Spacer(),
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
                padding: const EdgeInsets.all(1),
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
            const SizedBox(
              width: 12,
            ),
            Text(
              fruit.totalItems.toString(),
              style: bold.copyWith(fontSize: 14),
            ),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () =>
                  context.read<CartBloc>()..add(AddFromListFruitToCart(fruit)),
              child: Container(
                padding: const EdgeInsets.all(1),
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
