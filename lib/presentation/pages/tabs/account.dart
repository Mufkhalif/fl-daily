import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klikdaily/domain/models/profile.dart';
import 'package:klikdaily/presentation/blocs/profile/profile_bloc.dart';
import 'package:klikdaily/themes/theme.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({Key? key}) : super(key: key);

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: green,
                ),
              );
            } else if (state is ProfileHasData) {
              if (state.profile.results.isEmpty) {
                return Center(
                  child: Text(
                    'User not found',
                    style: bold,
                  ),
                );
              }

              return _renderContent(state.profile.results[0]);
            } else if (state is ProfileError) {
              return Center(
                child: Text(
                  state.message,
                  style: bold,
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _renderContent(User user) => Container(
        padding: const EdgeInsets.only(
          top: 42,
          left: 24,
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profil',
              style: bold.copyWith(fontSize: 22),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    user.picture.large,
                    height: 102,
                    width: 102,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${user.name.first} ${user.name.last}",
                      style: bold.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      user.email,
                      style: regular,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      user.cell,
                      style: regular,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${user.location.country} - ${user.location.city}",
                      style: regular,
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: green,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    'Keluar',
                    style: bold.copyWith(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      );
}
