import 'dart:convert';

import 'package:dangdiarysample/models/sticker/sticker_detail_model.dart';
import 'package:dangdiarysample/models/sticker/sticker_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class StickerRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<StickerModel> getStickerView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/sticker',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      StickerModel stickerModel =
          StickerModel.fromJson(json.decode(response.body));
      return stickerModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<StickerDetailModel> getStickerDetailView(int challengeId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/sticker/detail',
        {'userId': userId, 'challengeId': challengeId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      StickerDetailModel stickerDetailModel =
          StickerDetailModel.fromJson(json.decode(response.body));
      return stickerDetailModel;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
