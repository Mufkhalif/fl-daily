import 'dart:convert';

import 'package:klikdaily/domain/models/profile.dart';

import 'package:http/http.dart' as http;
import 'package:klikdaily/utils/exception.dart';

abstract class FruitRemoteDataSource {
  Future<ProfileResponse> getProfile();
}

class FruitRemoteDataSourceImpl implements FruitRemoteDataSource {
  static const baseUrl = "https://randomuser.me/api/";

  final http.Client client;

  FruitRemoteDataSourceImpl(this.client);

  @override
  Future<ProfileResponse> getProfile() async {
    final response = await client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      return ProfileResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException(
        message: json.decode(response.body)["message"] ?? "Server Failure",
      );
    }
  }
}
