import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:lottie/lottie.dart';

class SuccesPage extends StatefulWidget {
  static const routeName = "/success-payment";

  const SuccesPage({Key? key}) : super(key: key);

  @override
  State<SuccesPage> createState() => _SuccesPageState();
}

class _SuccesPageState extends State<SuccesPage> {
  @override
  void initState() {
    super.initState();

    context.read<CartBloc>()
      ..add(ClearAllCart())
      ..add(FetchingFruitToCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animation/success-payment.json',
              width: 300,
            ),
            Text(
              'Pembayaran Berhasil',
              style: bold.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Pembayaran yang ada buat berhasil dibayar, Terima kasih',
                textAlign: TextAlign.center,
                style: regular,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    'Kembeli',
                    style: bold.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
