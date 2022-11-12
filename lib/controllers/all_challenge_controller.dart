import 'package:get/get.dart';

class AllChallengeController extends GetxController {
  static AllChallengeController get to => Get.find();
  RxList<String> categoryList = ['전체', '산책', '간식', '여행', '훈련', '장난감'].obs;
  RxInt selectedCategory = 0.obs;
  RxBool isSearch = false.obs;
  RxList<String> overduedDiarys = [''].obs;

  void changeCategory(int index) {
    selectedCategory(index);
  }

  void search() {
    isSearch(true);
  }
}
