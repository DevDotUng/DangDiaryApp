import 'dart:convert';

import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class SplashRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<int> getSplashResponse(String? firebaseToken) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    if (userId == null) {
      return 401;
    }

    Uri url = Uri.http(
        _baseUrl,
        '/api/user',
        {'userId': userId, 'firebaseToken': firebaseToken}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      return 200;
    } else if (response.statusCode == 300) {
      return 300;
    } else {
      return 401;
    }
  }
}
