import 'package:get/get.dart';

enum PageName { HOME, SEARCH, DIARY, STICKER, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
        pageIndex(value);
        break;
      case PageName.SEARCH:
        pageIndex(value);
        break;
      case PageName.DIARY:
        pageIndex(value);
        break;
      case PageName.STICKER:
        pageIndex(value);
        break;
      case PageName.MYPAGE:
        pageIndex(value);
        break;
    }
  }
}
