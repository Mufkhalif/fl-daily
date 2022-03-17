// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:klikdaily/themes/theme.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: blue,
        padding: EdgeInsets.only(
          top: 72,
          // left: 24,
          // right: 24,
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(Icons.chevron_left),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: 72),
                child: Image.asset(
                  'assets/images/carrot.png',
                  width: 182,
                  height: 182,
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
                          'Sawi Hijau',
                          style: bold.copyWith(fontSize: 22),
                        ),
                        Spacer(),
                        Text(
                          'Rp. 15.000 /kg',
                          style: bold.copyWith(fontSize: 16, color: orange),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text('Deskripsi',
                        style: bold.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: orange,
                          decorationThickness: 4,
                        )),
                    SizedBox(height: 8),
                    Text(
                      'Sawi hijan mengandung folat, kalium, Vitamin C, dan Vitamin B6 dan rendah kolestrol, perpaduan ini membantu menjaga kesehatan jantung. Vitamin b6 dan folat mencegah penumpukan senyawa uang dikenal sebagai homocysteine',
                      style: regular.copyWith(
                          fontSize: 14, height: 2, color: Color(0xff777777)),
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
                              'Rp. 15.000 /kg',
                              style: bold.copyWith(fontSize: 16, color: orange),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          '2 kg',
                          style: bold.copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
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
                      ],
                    ),
                    SizedBox(
                      height: 44,
                    ),
                    Container(
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
                    SizedBox(
                      height: 200,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
