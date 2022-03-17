// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/domain/models/fruit.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/presentation/blocs/profile/profile_bloc.dart';
import 'package:klikdaily/presentation/blocs/search/search_bloc.dart';
import 'package:klikdaily/presentation/pages/search_page.dart';
import 'package:klikdaily/presentation/pages/tabs/account.dart';
import 'package:klikdaily/presentation/pages/tabs/cart.dart';
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
        BlocProvider(
          create: (_) => di.locator<ProfileBloc>(),
        ),
        BlocProvider(
          create: (_) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.routeName:
              return MaterialPageRoute(builder: (_) => const HomePage());
            case SearchPage.routeName:
              return MaterialPageRoute(builder: (_) => const SearchPage());
            case DetailPage.routeName:
              final item = settings.arguments as Fruit;
              return MaterialPageRoute(builder: (_) => DetailPage(fruit: item));
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                      body: Center(child: Text('Page not found :(')));
                },
              );
          }
        },
      ),
    );
  }
}
