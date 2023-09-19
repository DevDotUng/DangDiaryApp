import 'dart:convert';

import 'package:dangdiarysample/models/my_page/agree_model.dart';
import 'package:dangdiarysample/models/my_page/my_page_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class MyPageRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<MyPageModel> getMyPageView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/mypage',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.get(url);
    if (response.statusCode == 200) {
      MyPageModel myPageModel =
          MyPageModel.fromJson(json.decode(response.body));
      return myPageModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> editDogInfo(
    String nickname,
    String dogName,
    String? imagePath,
    String? breed,
    String birth,
    String gender,
  ) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');
    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    MultipartFile? profileImage;
    if (imagePath == null) {
      profileImage = null;
    } else {
      profileImage = MultipartFile.fromFileSync(imagePath);
    }

    var formData = FormData.fromMap({
      'userId': userId,
      'nickname': nickname,
      'dogName': dogName,
      'profileImage': profileImage,
      'breed': breed,
      'birth': birth,
      'gender': gender,
    });
    var response = await dio.post('/api/mypage/info', data: formData);

    return response.statusCode!;
  }

  Future<AgreeModel> editAgree(String type) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/mypage/agree',
        {'type': type, 'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.get(url);
    if (response.statusCode == 200) {
      AgreeModel agreeModel = AgreeModel.fromJson(json.decode(response.body));
      return agreeModel;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
