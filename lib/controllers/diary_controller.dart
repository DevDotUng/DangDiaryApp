import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  static DiaryController get to => Get.find();

  RxList<List> randomPositionStickerList = [[], []].obs;

  @override
  void onInit() {
    setRandomPosition();
    super.onInit();
  }

  void setRandomPosition() {
    for (int i = 0; i < 5; i++) {
      double top = Random().nextDouble() * (Get.height * 0.82 - 56.h);
      double left = Random().nextDouble() * (Get.width - 104.w);
      randomPositionStickerList[0].add(top);
      randomPositionStickerList[1].add(left);
    }
  }
}
