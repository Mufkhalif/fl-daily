// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:klikdaily/utils/extension.dart';
import 'package:klikdaily/utils/format_money.dart';
import 'package:klikdaily/utils/get_description.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "/detail-page";

  const DetailPage({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  final Fruit fruit;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int total = 1;

  void _addToCart() {
    final newFruit = widget.fruit.copyWith(totalItems: total);
    context.read<CartBloc>().add(AddFruitToCart(newFruit));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CartBloc, CartState>(
        listenWhen: (previous, current) => previous.message != current.message,
        listener: (context, state) {
          if (state.message.isNotEmpty && state.message != "") {
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  backgroundColor: yellow,
                  content: Text(
                    state.message,
                    style: bold.copyWith(color: Colors.white),
                  ),
                ),
              );

            context.read<CartBloc>().add(SetCurrentMessage());
            context.read<CartBloc>().add(FetchingFruitToCart());
          }
        },
        child: Container(
          color: widget.fruit.bgColor.toColor(),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(top: 72),
                  child: Hero(
                    tag: widget.fruit.id,
                    child: Image.asset(
                      'assets/images/${widget.fruit.assets}',
                      width: 182,
                      height: 182,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 290),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 4,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          Text(
                            widget.fruit.name,
                            style: bold.copyWith(fontSize: 22),
                          ),
                          Spacer(),
                          Text(
                            'Rp. ${formatMoney(widget.fruit.price)} /kg',
                            style: bold.copyWith(fontSize: 16, color: orange),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'Deskripsi',
                        style: bold.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: orange,
                          decorationThickness: 4,
                        ),
                      ),
                      SizedBox(height: 8),
                      ReadMoreText(
                        getDescriptByTypeFruit(widget.fruit.typeFruit),
                        trimLines: 6,
                        colorClickableText: orange,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Lihat lebih banyak',
                        trimExpandedText: 'Lihat lebih sedikit',
                        style: regular,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total',
                                style: bold.copyWith(fontSize: 18),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Rp. ${formatMoney(widget.fruit.price * total)} /kg',
                                style:
                                    bold.copyWith(fontSize: 16, color: orange),
                              ),
                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => total == 1
                                ? null
                                : setState(() {
                                    total -= 1;
                                  }),
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: total == 1 ? Colors.grey : Colors.orange,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            total.toString(),
                            style: bold.copyWith(fontSize: 14),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () => setState(() {
                              total += 1;
                            }),
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 44,
                      ),
                      GestureDetector(
                        onTap: _addToCart,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              'Masukkan ke Keranjang',
                              style: bold.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24, top: 72),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 12,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Icon(Icons.chevron_left),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
