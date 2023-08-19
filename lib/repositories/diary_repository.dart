import 'dart:convert';

import 'package:dangdiarysample/models/diary/diary_with_cover_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class DiaryRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<DiaryWithCoverModel> getDiaryView(int coverId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/diaries',
        {'userId': userId, 'coverId': coverId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.get(url);
    if (response.statusCode == 200) {
      DiaryWithCoverModel diaryWithCoverModel =
          DiaryWithCoverModel.fromJson(json.decode(response.body));
      return diaryWithCoverModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> editCoverTitle(int coverId, String title) async {
    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    var formData = FormData.fromMap({
      'coverId': coverId,
      'title': title,
    });
    var response = await dio.put('/api/diaries/title', data: formData);
    if (response.statusCode == 201) {
      return 201;
    } else {
      return 0;
    }
  }

  Future<int> editCoverColor(
      int coverId, String coverColor, String holderColor) async {
    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    var formData = FormData.fromMap({
      'coverId': coverId,
      'coverColor': coverColor,
      'holderColor': holderColor,
    });
    var response = await dio.put('/api/diaries/color', data: formData);
    if (response.statusCode == 201) {
      return 201;
    } else {
      return 0;
    }
  }

  Future<int> changeIsPublicDiary(int diaryId, bool isPublic) async {
    Uri url = Uri.http(
        _baseUrl,
        '/api/diary/public',
        {'diaryId': diaryId, 'isPublic': isPublic}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.put(url);
    if (response.statusCode == 201) {
      return 201;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> deleteAllThisMonthDiaries(int coverId, List<int> diaryIds) async {
    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    var formData = FormData.fromMap({
      'coverId': coverId,
      'diaryIds': diaryIds,
    });
    var response = await dio.delete('/api/diaries/delete/all', data: formData);
    if (response.statusCode == 204) {
      return 204;
    } else {
      return 0;
    }
  }
}
