import 'dart:convert';

import 'package:dangdiarysample/models/customer_center/Inquiry_history_model.dart';
import 'package:dangdiarysample/models/customer_center/customer_center_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class CustomerCenterRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<CustomerCenterModel> getCustomerCenterView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/customerCenter',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.get(url);
    if (response.statusCode == 200) {
      CustomerCenterModel customerCenterModel =
          CustomerCenterModel.fromJson(json.decode(response.body));
      return customerCenterModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> inquiry(String type, String title, String content) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    var dio = Dio();
    dio.options.baseUrl = 'http://' + _baseUrl;
    dio.options.contentType = 'multipart/form-data';

    var formData = FormData.fromMap({
      'userId': userId,
      'type': type,
      'title': title,
      'content': content,
    });
    var response =
        await dio.post('/api/customerCenter/inquiry', data: formData);
    if (response.statusCode == 200) {
      return 200;
    } else {
      return 0;
    }
  }

  Future<List<InquiryHistoryModel>> getInquiryHistoryView() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/customerCenter/inquiry/history',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<InquiryHistoryModel> inquiryHistoryModel =
          body.map((data) => InquiryHistoryModel.fromJson(data)).toList();
      return inquiryHistoryModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> likeInquiry(int inquiryId, bool isLike) async {
    Uri url = Uri.http(
        _baseUrl,
        '/api/customerCenter/inquiry/history/like',
        {'inquiryId': inquiryId, 'isLike': isLike}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.put(url);
    if (response.statusCode == 200) {
      return 200;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> likeFAQ(int faqId, bool isLike) async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/customerCenter/like',
        {'userId': userId, 'faqId': faqId, 'isLike': isLike}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await http.put(url);
    if (response.statusCode == 200) {
      return 200;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
