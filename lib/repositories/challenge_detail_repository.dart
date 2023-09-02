import 'dart:convert';

import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/models/challenge_detail/challenge_detail_model.dart';
import 'package:dangdiarysample/models/challenge_detail/overdue_diary_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class ChallengeDetailRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<ChallengeDetailModel> getChallengeDetailView(int challengeId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/challengeDetail',
        {'userId': userId, 'challengeId': challengeId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      ChallengeDetailModel challengeDetailModel =
          ChallengeDetailModel.fromJson(json.decode(response.body));
      return challengeDetailModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<bool> startChallenge(int challengeId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/challengeDetail/start',
        {'userId': userId, 'challengeId': challengeId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      BottomNavController.to.challengeInit();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> stopChallenge(int challengeId, String reason) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/challengeDetail/stop',
        {'userId': userId, 'challengeId': challengeId, 'reason': reason}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      BottomNavController.to.challengeInit();
      return false;
    } else {
      return true;
    }
  }

  Future<OverdueDiaryModel> endChallenge(int challengeId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/challengeDetail/end',
        {'userId': userId, 'challengeId': challengeId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      OverdueDiaryModel overdueDiary =
          OverdueDiaryModel.fromJson(json.decode(response.body));
      return overdueDiary;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
