import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeDetailController extends GetxController {
  static ChallengeDetailController get to => Get.find();
  late ScrollController scrollController;
  RxDouble scrollPosition = 0.0.obs;
  String challengeContent =
      '한강공원에서 반려견과 술래잡기를 해보세요! 신나게 뛰어 놀다 보면 시간도 뚝딱! 매일 지루한 산책만 하기 보단, 더 활발하게 뛰어 노는 걸 우리 아이도 분명 좋아할 거에요. 물론 보호자님은 좀 힘들겠지만요 한강공원에서 반려견과 술래잡기를 해보세요! 신나게 뛰어 놀다 보면 시간도 뚝딱! 매일 지루한 산책만 하기 보단, 더 활발하게 뛰어 노는 걸 우리 아이도 분명 좋아할 거에요. 물론 보호자님은 좀 힘들겠지만요 한강공원에서 반려견과 술래잡기를 해보세요! 신나게 뛰어 놀다 보면 시간도 뚝딱! 매일 지루한 산책만 하기 보단, 더 활발하게 뛰어 노는 걸 우리 아이도 분명 좋아할 거에요. 물론 보호자님은 좀 힘들겠지만요';
  RxBool isChallenge = false.obs;
  RxBool isMore = false.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    loading();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    scrollPosition(scrollController.position.pixels);
  }

  void setIsChallenge(bool isChallenge) {
    this.isChallenge(isChallenge);
  }

  void changeIsMore() {
    if (isMore == true) {
      isMore(false);
    } else {
      isMore(true);
    }
  }

  RxBool isLoading = true.obs;
  void loading() async {
    await Future.delayed(Duration(seconds: 2));
    isLoading(false);
  }
}
