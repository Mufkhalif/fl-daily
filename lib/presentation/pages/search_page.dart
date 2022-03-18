// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/presentation/blocs/cart/cart_bloc.dart';
import 'package:klikdaily/presentation/blocs/search/search_bloc.dart';
import 'package:klikdaily/themes/theme.dart';
import 'package:klikdaily/widgets/container_list_type.dart';

class SearchPage extends StatefulWidget {
  static const routeName = "/search";

  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  void _searchQuery(String value) {
    context.read<SearchBloc>().add(SearchFruit(value));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CartBloc, CartState>(
        listenWhen: (previous, current) => previous.message != current.message,
        listener: (context, state) {
          if (state.message.isNotEmpty) {
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(
                height: 62,
              ),
              Row(
                children: [
                  Text(
                    'Pencarian',
                    style: bold.copyWith(fontSize: 18),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.close,
                      color: dark,
                      size: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: searchController,
                onChanged: _searchQuery,
                style: regular,
                decoration: InputDecoration(
                  hintStyle: regular.copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  hintText: "masukan kata kunci ...",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.7)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.7)),
                  ),
                ),
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchHasData) {
                    if (state.result.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Kata kunci ${searchController.text}",
                              style: bold.copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Coba Cari lagi menggunakan kata kunci yang berbeda",
                              textAlign: TextAlign.center,
                              style: regular,
                            )
                          ],
                        ),
                      );
                    }

                    if (state.result.isNotEmpty &&
                        searchController.text.isNotEmpty) {
                      return Expanded(
                        child: ContainerListAll(
                          fruits: state.result,
                        ),
                      );
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      "Masukan kata kunci untuk memulai pencarian ...",
                      textAlign: TextAlign.center,
                      style: regular,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
