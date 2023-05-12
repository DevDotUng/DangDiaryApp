import 'package:dangdiarysample/pages/search_posts_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SearchPostsController extends GetxController {
  late List<String> autoCompleteWords;
  SearchPostsController({required this.autoCompleteWords});
  static SearchPostsController get to => Get.find();

  RxList searchHistory = [].obs;

  RxList autoCompleteWord = [].obs;
  late TextEditingController textEditingController;
  RxString searchText = ''.obs;

  @override
  void onInit() async {
    textEditingController = TextEditingController();
    Box searchBox = await Hive.openBox('searchHistory');
    List<dynamic>? searchHistoryList = searchBox.get('postsSearch');
    if (searchHistoryList == null) {
      searchBox.put('postsSearch', []);
      searchHistory([]);
    } else {
      searchHistoryList.remove('');
      searchHistory(searchHistoryList);
    }
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
      if (word != null && word.contains(text)) {
        autoCompleteWord.add(word);
      }
    }
  }

  void searchTextClear() {
    searchText('');
  }

  Future<void> search(BuildContext context, String text) async {
    Box searchBox = await Hive.openBox('searchHistory');
    List<dynamic>? searchHistoryList = searchBox.get('postsSearch');
    if (searchHistoryList != null &&
        !searchHistoryList.contains(text) &&
        text.isNotEmpty) {
      searchHistoryList.add(text);
      searchHistory(searchHistoryList);
      searchBox.put('postsSearch', searchHistoryList);
    }

    if (text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPostsResult(
            query: text,
          ),
        ),
      );
    }
  }

  Future<void> deleteHistory(int index) async {
    Box searchBox = await Hive.openBox('searchHistory');
    searchHistory.removeAt(index);
    searchBox.put('postsSearch', searchHistory);
  }
}
