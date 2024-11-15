import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverdueDiariesController extends GetxController {
  static OverdueDiariesController get to => Get.find();
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
    if (scrollController.offset > 169.h) {
      isSliver(true);
    } else {
      isSliver(false);
    }
  }
}
