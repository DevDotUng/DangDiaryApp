import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchPostsController extends GetxController {
  static SearchPostsController get to => Get.find();

  RxList searchHistory = [
    '전기담요에서 간식먹기',
    '눈밭에서 백덤블링하기',
    '한강공원 술래잡기',
    '중랑천 산책하기',
    '한강공원 원반던지기',
    '한강에서 피크닉한 날',
    '한강이 좋아',
  ].obs;
  List<String> autoCompleteWords = [
    '전기담요에서 간식먹기',
    '눈밭에서 백덤블링하기',
    '한강공원 술래잡기',
    '중랑천 산책하기',
    '한강공원 원반던지기',
    '한강에서 피크닉한 날',
    '한강이 좋아',
  ];
  RxList autoCompleteWord = [].obs;
  late TextEditingController textEditingController;
  RxString searchText = ''.obs;

  @override
  void onInit() {
    textEditingController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void changeTextListener(String text) {
    searchText(text);
    autoCompleteWord.clear();
    for (String word in autoCompleteWords) {
      if (word.contains(text)) {
        autoCompleteWord.add(word);
      }
    }
  }

  void searchTextClear() {
    searchText('');
  }
}
