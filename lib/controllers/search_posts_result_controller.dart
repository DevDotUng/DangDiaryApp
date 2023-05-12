import 'package:dangdiarysample/models/browse/search_posts_result_model.dart';
import 'package:dangdiarysample/repositories/browse_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPostsResultController extends GetxController {
  late String query;
  SearchPostsResultController({required this.query});
  static SearchPostsResultController get to => Get.find();

  final searchPostsResultModel = Rxn<SearchPostsResultModel>();

  RxInt tabBarIndex = 0.obs;
  late TextEditingController textEditingController;
  RxString searchText = ''.obs;

  @override
  void onInit() {
    textEditingController = TextEditingController(text: query);
    searchPostsResultInit();
    super.onInit();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  Future<void> searchPostsResultInit() async {
    String queryParameter;
    if (query.startsWith('#')) {
      queryParameter = query.substring(1);
    } else {
      queryParameter = query;
      tabBarIndex(1);
    }
    SearchPostsResultModel searchPostsResultModelTemp =
        await BrowseRepository().getSearchPostsResult(queryParameter);
    searchPostsResultModel(searchPostsResultModelTemp);
  }

  void changeTabBarIndex(int index) {
    tabBarIndex(index);
  }

  double getTabBarPosition(int index) {
    if (index == 2) {
      return (Get.width - 48.w) * 2 / 3;
    } else if (index == 1) {
      return (Get.width - 48.w) / 3;
    } else {
      return 0;
    }
  }

  void searchTextClear() {
    searchText('');
  }
}
