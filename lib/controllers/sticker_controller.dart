import 'package:dangdiarysample/models/sticker/locked_sticker_model.dart';
import 'package:dangdiarysample/models/sticker/my_sticker_model.dart';
import 'package:dangdiarysample/models/sticker/sticker_model.dart';
import 'package:dangdiarysample/repositories/sticker_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StickerController extends GetxController {
  static StickerController get to => Get.find();

  final stickerModel = Rxn<StickerModel>();
  List<dynamic> latestOrderList = [];
  List<dynamic> myLatestOrderList = [];
  List<dynamic> oldOrderList = [];
  List<dynamic> myOldOrderList = [];

  RxInt tabBarIndex = 0.obs;
  RxBool isSliver = false.obs;
  RxBool showLockedSticker = true.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    stickerInit();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> stickerInit() async {
    StickerModel stickerModelTemp = await StickerRepository().getStickerView();
    stickerModel(stickerModelTemp);

    latestOrderList.addAll(stickerModel.value!.myStickers);
    myLatestOrderList.addAll(stickerModel.value!.myStickers);
    oldOrderList.addAll(stickerModel.value!.myStickers.reversed);
    myOldOrderList.addAll(stickerModel.value!.myStickers.reversed);

    latestOrderList.addAll(stickerModel.value!.lockedStickers);
    oldOrderList.addAll(stickerModel.value!.lockedStickers);
  }

  void _scrollListener() {
    if (scrollController.offset > 160.h) {
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

  void changeShowLockedSticker() {
    showLockedSticker(!showLockedSticker.value);
  }
}
