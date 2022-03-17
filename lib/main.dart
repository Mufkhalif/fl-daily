// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/presentation/pages/cart_page.dart';
import 'package:klikdaily/presentation/pages/detail_page.dart';
import 'package:klikdaily/presentation/pages/home_page.dart';

import 'injection.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // home: const DetailPage(),
        // home: CartPage(),
      ),
    );
  }
}
