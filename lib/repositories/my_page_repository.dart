import 'dart:convert';

import 'package:dangdiarysample/models/my_page/my_page_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class MyPageRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<MyPageModel> getHomeView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/mypage',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      MyPageModel myPageModel =
          MyPageModel.fromJson(json.decode(response.body));
      return myPageModel;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
