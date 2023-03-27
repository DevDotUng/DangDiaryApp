import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dio/dio.dart';

class WriteDiaryRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<int> writeDiary(
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

    return response.statusCode!;
  }
}
