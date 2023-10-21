import 'dart:convert';

import 'package:dangdiarysample/models/browse/browse_view_model.dart';
import 'package:dangdiarysample/models/browse/posts_model.dart';
import 'package:dangdiarysample/models/browse/search_posts_result_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';

class BrowseRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<BrowseViewModel> getBrowseView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/browse',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      BrowseViewModel browseViewModel =
          BrowseViewModel.fromJson(json.decode(response.body));
      return browseViewModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<List<PostsModel>> getPostsView(int browseId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/browse/posts',
        {'userId': userId, 'browseId': browseId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<PostsModel> postsModels =
          body.map((data) => PostsModel.fromJson(data)).toList();
      return postsModels;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<List<PostsModel>> getPostsSearchView(String? query, String? searchType,
      String? dogName, String? nickname) async {
    Uri url = Uri.http(
        _baseUrl,
        '/api/browse/posts/search',
        {
          'query': query,
          'searchType': searchType,
          'dogName': dogName,
          'nickname': nickname
        }.map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<PostsModel> postsModels =
          body.map((data) => PostsModel.fromJson(data)).toList();
      return postsModels;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<SearchPostsResultModel> getSearchPostsResult(String text) async {
    Uri url = Uri.http(_baseUrl, '/api/browse/search',
        {'query': text}.map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      SearchPostsResultModel searchPostsResult =
          SearchPostsResultModel.fromJson(json.decode(response.body));
      return searchPostsResult;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int?> getIsChallenge(String hashTag) async {
    Uri url = Uri.http(
        _baseUrl,
        '/api/browse/posts/challenge',
        {'hashTag': hashTag}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      int? challengeId = int.tryParse(response.body);
      return challengeId;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> likeDiary(int diaryId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/browse/posts/like',
        {'userId': userId, 'diaryId': diaryId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await put(url);
    if (response.statusCode == 200) {
      int? challengeId = response.statusCode;
      return challengeId;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> reportDiary(int diaryId, String status, String reason) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    var body = jsonEncode({
      "diaryId": diaryId,
      "userId": userId,
      "status": status,
      "reason": reason,
    });

    var response = await post(
      Uri.http(_baseUrl, '/api/report'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 201) {
      return 201;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
