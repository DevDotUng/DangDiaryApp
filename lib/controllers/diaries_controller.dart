import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiariesController extends GetxController {
  static DiariesController get to => Get.find();
  RxInt tabBarIndex = 0.obs;
  RxBool diaryHolderBool = false.obs;
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
    if (scrollController.offset > 169.h) {
      isSliver(true);
    } else {
      isSliver(false);
    }
  }

  void changeTabBarIndex(int index) {
    if (index == 1) {
      diaryHolderBool(true);
    } else if (index == 2) {
      if (scrollController.offset > 169.h) {
        scrollController.animateTo(
          169.h,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
      diaryHolderBool(false);
    } else {
      if (scrollController.offset > 169.h) {
        scrollController.animateTo(
          169.h,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
      diaryHolderBool(false);
    }
    tabBarIndex(index);
  }

  double getTabBarPosition(int index) {
    if (index == 2) {
      return 80;
    } else if (index == 1) {
      return 40;
    } else {
      return 0;
    }
  }

  double getTabBarWidth(int index) {
    if (index == 2) {
      return 63;
    } else {
      return 40;
    }
  }
}
