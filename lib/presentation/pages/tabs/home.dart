// ignore_for_file: deprecated_member_use

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/presentation/pages/search_page.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:klikdaily/utils/type_fruits.dart';
import 'package:klikdaily/widgets/container_list_type.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
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
        }
      },
      child: SafeArea(
        child: DefaultTabController(
          length: listTabItem.length,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 42,
                ),
                Row(
                  children: [
                    Text(
                      'Find',
                      style: bold.copyWith(color: yellow, fontSize: 22),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Fresh Groceries',
                      style: bold.copyWith(color: green, fontSize: 22),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/onboarding_1.png',
                      width: 52,
                      height: 52,
                    )
                  ],
                ),
                Text(
                  'Dengan kondisi dan harga terbaik',
                  style: regular.copyWith(
                      fontSize: 14, color: dark.withOpacity(0.5)),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, SearchPage.routeName),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: dark.withOpacity(0.5)),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Cari sayuran ...',
                          style: regular.copyWith(
                              fontSize: 14, color: dark.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ButtonsTabBar(
                  height: 42,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: green,
                    border: Border.all(color: green, width: 2),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  unselectedDecoration: BoxDecoration(
                    color: grey,
                    borderRadius: BorderRadius.circular(
                      34,
                    ),
                  ),
                  labelStyle: bold.copyWith(color: Colors.white),
                  unselectedLabelStyle: regular.copyWith(color: dark),
                  radius: 32,
                  tabs: listTabItem.map((e) => Tab(text: e.name)).toList(),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: TabBarView(
                    children: listTabItem
                        .map((e) => ContainerListType(typeFruit: e.typeFruit))
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
