import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StickerController extends GetxController {
  static StickerController get to => Get.find();
  RxInt tabBarIndex = 0.obs;
  RxBool isSliver = false.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController.offset > 161.h) {
      isSliver(true);
    } else {
      isSliver(false);
    }
  }

  void changeTabBarIndex(int index) {
    tabBarIndex(index);
  }

  double getTabBarPosition(int index) {
    if (index == 1) {
      return 78;
    } else {
      return 0;
    }
  }

  double getTabBarWidth(int index) {
    if (index == 1) {
      return 63;
    } else {
      return 78;
    }
  }

  RxBool isLoading = true.obs;
  void loading() async {
    await Future.delayed(Duration(seconds: 2));
    isLoading(false);
  }
}
