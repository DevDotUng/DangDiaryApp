import 'dart:convert';
import 'dart:io';

import 'package:dangdiarysample/models/login/login_response_model.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginRepository {
  final String _baseUrl = PublicRepository.baseUrl;

  void kakaoLogin(String? firebaseToken) async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);

      if (response.statusCode == 200) {
        String accessToken = token.accessToken;
        String? refreshToken = token.refreshToken;

        LoginResponseModel loginResponse =
            await sendUserInfoKakao(accessToken, refreshToken, firebaseToken);

        int userId = loginResponse.userId;

        if (userId != 0) {
          Box homeBox = await Hive.openBox('userInfo');
          homeBox.put('userId', userId);

          if (loginResponse.existDog) {
            Get.offAndToNamed('/app');
          } else {
            Get.offAndToNamed('/');
          }
        }
      }
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  Future<LoginResponseModel> sendUserInfoKakao(
      String accessToken, String? refreshToken, String? firebaseToken) async {
    Uri url = Uri.http(
        _baseUrl,
        '/api/user/kakao',
        {
          'accessToken': accessToken,
          'refreshToken': refreshToken,
          'firebaseToken': firebaseToken
        }.map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(json.decode(response.body));
      return loginResponseModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  void appleLogin(String? firebaseToken) async {
    try {
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      LoginResponseModel loginResponse = await sendUserInfoApple(
        credential.userIdentifier,
        credential.authorizationCode,
        credential.identityToken,
        credential.familyName,
        credential.givenName,
        firebaseToken,
      );

      int userId = loginResponse.userId;

      if (userId != 0) {
        Box homeBox = await Hive.openBox('userInfo');
        homeBox.put('userId', userId);

        if (loginResponse.existDog) {
          Get.offAndToNamed('/app');
        } else {
          Get.offAndToNamed('/');
        }
      }
    } catch (error) {
      print('error = $error');
    }
  }

  Future<LoginResponseModel> sendUserInfoApple(
    String? userIdentifier,
    String authorizationCode,
    String? clientSecret,
    String? familyName,
    String? givenName,
    String? firebaseToken,
  ) async {
    Uri url = Uri.http(
        _baseUrl,
        '/api/user/apple',
        {
          'userIdentifier': userIdentifier,
          'authorizationCode': authorizationCode,
          'clientSecret': clientSecret,
          'familyName': familyName,
          'givenName': givenName,
          'firebaseToken': firebaseToken,
        }.map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      LoginResponseModel loginResponseModel =
          LoginResponseModel.fromJson(json.decode(response.body));
      return loginResponseModel;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> logout() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/user/logout',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await get(url);
    if (response.statusCode == 200) {
      return 200;
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<int> deleteAccount() async {
    Box homeBox = await Hive.openBox('userInfo');
    int userId = homeBox.get('userId');

    Uri url = Uri.http(
        _baseUrl,
        '/api/user/delete',
        {'userId': userId}
            .map((key, value) => MapEntry(key, value.toString())));

    var response = await delete(url);
    if (response.statusCode == 200) {
      return 200;
    } else {
      return Future.error(response.statusCode);
    }
  }
}
