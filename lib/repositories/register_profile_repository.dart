import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dio/dio.dart';

class RegisterProfileRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  Future<int> registerProfile(
    int userId,
    String nickname,
    String dogName,
    String? imagePath,
    String? breed,
    String birth,
    String gender,
  ) async {
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
    var response = await dio.post('/api/user/info', data: formData);

    return response.statusCode!;
  }
}
