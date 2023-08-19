import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/models/diaries/search_my_diary_model.dart';
import 'package:dangdiarysample/repositories/mydiaries_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SearchDiaryController extends GetxController {
  static SearchDiaryController get to => Get.find();

  RxList<SearchMyDiaryModel> searchMyDiaryModelList =
      <SearchMyDiaryModel>[].obs;

  RxList searchHistory = [].obs;
  RxList autoCompleteWord = [].obs;
  late TextEditingController textEditingController;
  RxString searchText = ''.obs;

  @override
  void onInit() async {
    textEditingController = TextEditingController();
    Box searchBox = await Hive.openBox('searchHistory');
    List<dynamic>? searchHistoryList = searchBox.get('diarySearch');
    if (searchHistoryList == null) {
      searchBox.put('diarySearch', []);
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
    searchMyDiaryModelList.clear();
    searchText(text);
    autoCompleteWord.clear();
    for (String word
        in DiariesController.to.myDiariesModel.value!.autoCompleteWords) {
      if (word.contains(text)) {
        autoCompleteWord.add(word);
      }
    }
  }

  void searchTextClear() {
    searchText('');
  }

  Future<void> search(BuildContext context, String text) async {
    Box searchBox = await Hive.openBox('searchHistory');
    List<dynamic>? searchHistoryList = searchBox.get('diarySearch');
    if (searchHistoryList != null &&
        !searchHistoryList.contains(text) &&
        text.isNotEmpty) {
      searchHistoryList.add(text);
      searchHistory(searchHistoryList);
      searchBox.put('diarySearch', searchHistoryList);
    }

    if (text.isNotEmpty) {
      searchMyDiaryModelList(await MyDiariesRepository().searchMyDiary(text));
    }
  }

  Future<void> deleteHistory(int index) async {
    Box searchBox = await Hive.openBox('searchHistory');
    searchHistory.removeAt(index);
    searchBox.put('diarySearch', searchHistory);
  }

  void searchByHistoryOrAutoCompleteWord(BuildContext context, String text) {
    textEditingController.text = text;
    search(context, text);
  }
}
