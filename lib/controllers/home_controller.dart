import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  late ScrollController scrollController;
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
    scrollController = ScrollController();
    loading();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
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
