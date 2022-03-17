import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/presentation/blocs/profile/profile_bloc.dart';
import 'package:klikdaily/presentation/pages/tabs/account.dart';
import 'package:klikdaily/presentation/pages/tabs/cart.dart';
import 'package:klikdaily/presentation/pages/tabs/home.dart';
import 'package:klikdaily/themes/theme.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    context.read<ProfileBloc>().add(FetchingProfile());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            ? const HomeTab()
            : _selectedIndex == 1
                ? const CartTab()
                : const AccountTab());
  }
}
