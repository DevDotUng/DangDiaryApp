import 'dart:convert';

import 'package:dangdiarysample/models/write_diary/complete_diary_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dio/dio.dart';

class WriteDiaryRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<CompleteDiaryModel?> writeDiary(
    int diaryId,
    int userId,
    int challengeId,
    String endDate,
    String weather,
    String feeling,
    String title,
    String content,
    List<String> imagePaths,
    List<String> tags,
    bool isPublic,
  ) async {
    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    List<MultipartFile> images = imagePaths
        .map((imagePath) => MultipartFile.fromFileSync(imagePath))
        .toList();

    var formData = FormData.fromMap({
      'diaryId': diaryId,
      'userId': userId,
      'challengeId': challengeId,
      'endDate': endDate,
      'weather': weather,
      'feeling': feeling,
      'title': title,
      'content': content,
      'images': images,
      'tags': tags,
      'isPublic': isPublic,
    });
    var response = await dio.post('/api/writeDiary', data: formData);

    if (response.statusCode == 201) {
      CompleteDiaryModel completeDiaryModel =
          CompleteDiaryModel.fromJson(response.data);
      return completeDiaryModel;
    } else {
      return null;
    }
  }

  Future<int> overdueDiary(
    int diaryId,
    int userId,
    int challengeId,
    String endDate,
    String? weather,
    String? feeling,
    String? title,
    String? content,
    bool isPublic,
  ) async {
    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    var formData = FormData.fromMap({
      'diaryId': diaryId,
      'userId': userId,
      'challengeId': challengeId,
      'endDate': endDate,
      'weather': weather,
      'feeling': feeling,
      'title': title,
      'content': content,
      'isPublic': isPublic,
    });
    var response = await dio.post('/api/writeDiary/overdue', data: formData);

    if (response.statusCode == 200) {
      return 200;
    } else {
      return 0;
    }
  }

  Future<int> editDiary(
    int diaryId,
    String endDate,
    String weather,
    String feeling,
    String title,
    String content,
    List<String> imagePaths,
    List<String> tags,
    bool isPublic,
  ) async {
    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    List<MultipartFile> images = imagePaths
        .map((imagePath) => MultipartFile.fromFileSync(imagePath))
        .toList();

    var formData = FormData.fromMap({
      'diaryId': diaryId,
      'endDate': endDate,
      'weather': weather,
      'feeling': feeling,
      'title': title,
      'content': content,
      'images': images,
      'tags': tags,
      'isPublic': isPublic,
    });
    var response = await dio.put('/api/diary', data: formData);

    if (response.statusCode == 201) {
      return 201;
    } else {
      return 0;
    }
  }
}
