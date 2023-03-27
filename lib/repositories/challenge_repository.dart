import 'dart:convert';

import 'package:dangdiarysample/models/challenge/challenge_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class ChallengeRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<ChallengeModel> getChallengeView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/challenge',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      ChallengeModel challengeModel =
          ChallengeModel.fromJson(json.decode(response.body));
      return challengeModel;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
