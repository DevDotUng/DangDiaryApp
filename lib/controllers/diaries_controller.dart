import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiariesController extends GetxController {
  static DiariesController get to => Get.find();
  RxInt tabBarIndex = 0.obs;
  RxBool diaryHolderBool = false.obs;
  RxBool isSliver = false.obs;
  late ScrollController scrollController;

  List<String> diaryTitles = ['초코와 겨울', '요즘 초코가 기운이 없어ㅠㅠ', '누가 뭐래도 초코가 최고야'];
  List coverColors = [
    Color(0xffFF9686),
    Color(0xffD3E0FF),
    Color(0xffCF8EF5),
  ];
  List holderColors = [
    Color(0xff8BACFF),
    Color(0xffB5C9FF),
    Color(0xffEF7260),
  ];

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
    if (index == 1) {
      return 40;
    } else {
      return 0;
    }
  }
}
