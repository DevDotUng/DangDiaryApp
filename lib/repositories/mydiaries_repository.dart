import 'dart:convert';

import 'package:dangdiarysample/models/diaries/mydiaries_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class MyDiariesRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<MyDiariesModel> getMyDiariesView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/myDiary',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      MyDiariesModel myDiariesModel =
          MyDiariesModel.fromJson(json.decode(response.body));
      return myDiariesModel;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
