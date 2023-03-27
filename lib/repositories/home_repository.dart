import 'dart:convert';

import 'package:dangdiarysample/models/home/home_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class HomeRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<HomeModel> getHomeView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/home',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      HomeModel homeModel = HomeModel.fromJson(json.decode(response.body));
      return homeModel;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
