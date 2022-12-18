import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late PageController pageController;
  RxList imageList = [
    'assets/dog.png',
    'assets/dog2.png',
    'assets/dog.png',
    'assets/dog2.png',
    'assets/dog.png',
    'assets/dog2.png',
    'assets/dog.png',
    'assets/dog2.png',
    'assets/dog.png',
    'assets/dog2.png',
  ].obs;
  RxInt mainIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController(viewportFraction: 0.177);
    pageController.addListener(pageScrollListener);
    loading();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void pageScrollListener() {
    if (pageController.page! % 0.5 < 0.4) {
      mainIndex(pageController.page?.toInt());
    }
  }

  void changeIndex(int index) {
    mainIndex(index);
    print(mainIndex);
  }

  RxBool isLoading = true.obs;
  void loading() async {
    await Future.delayed(Duration(seconds: 2));
    isLoading(false);
  }
}
