// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klikdaily/themes/theme.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
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
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/patato.png',
                      width: 62,
                      height: 62,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kentang',
                          style: bold.copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Rp. 15000/kg',
                          style: regular.copyWith(fontSize: 14, color: orange),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        // color: green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: green,
                        size: 22,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      '1',
                      style: bold.copyWith(fontSize: 14),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
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
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 12),
            decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Total Item: 8',
                      style: regular.copyWith(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: orange,
                        decorationThickness: 4,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rp 120.000',
                      style: bold.copyWith(color: Colors.white, fontSize: 16),
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
        )
      ],
    );
  }
}
