import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PageName { HOME, DIARY, BROWSE, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  RxBool isShowBottomModal = true.obs;
  late PageController pageController;
  RxDouble page = 0.0.obs;

  @override
  void onInit() {
    pageController = PageController();
    pageController.addListener(pageChangeListener);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void pageChangeListener() {
    page(pageController.page);
  }

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
        pageIndex(value);
        break;
      case PageName.DIARY:
        pageIndex(value);
        break;
      case PageName.BROWSE:
        pageIndex(value);
        break;
      case PageName.MYPAGE:
        pageIndex(value);
        break;
    }
  }

  void changeIsShowBottomModal() {
    isShowBottomModal(!isShowBottomModal.value);
  }
}
