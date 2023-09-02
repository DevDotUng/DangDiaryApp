import 'dart:async';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/models/challenge_detail/challenge_detail_model.dart';
import 'package:dangdiarysample/models/challenge_detail/overdue_diary_model.dart';
import 'package:dangdiarysample/repositories/challenge_detail_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChallengeDetailController extends GetxController {
  late BuildContext context;
  late int challengeId;
  ChallengeDetailController({required this.context, required this.challengeId});
  static ChallengeDetailController get to => Get.find();

  final challengeDetailModel = Rxn<ChallengeDetailModel>();

  late Duration countdownDuration;
  Rx<Duration> duration = Duration().obs;
  Timer? timer;
  RxBool countDown = true.obs;

  late FToast fToast;
  late ScrollController scrollController;
  RxDouble scrollPosition = 0.0.obs;
  RxBool isChallenge = false.obs;
  RxBool isMore = false.obs;

  @override
  void onInit() async {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    fToast = FToast();
    fToast.init(context);
    await challengeDetailInit();
    reset();
    startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> challengeDetailInit() async {
    ChallengeDetailModel challengeDetailModelTemp =
        await ChallengeDetailRepository().getChallengeDetailView(challengeId);
    challengeDetailModel(challengeDetailModelTemp);
    isChallenge(challengeDetailModel.value!.isChallenge);

    if (challengeDetailModel.value?.recommendDate != null) {
      setDuration(challengeDetailModel.value!.recommendDate);
    } else {
      countdownDuration = const Duration(hours: 0, minutes: 0, seconds: 0);
    }
  }

  void setDuration(String recommendDate) {
    DateTime datetime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(recommendDate);
    DateTime now = DateTime.now();
    int hour = (datetime.millisecondsSinceEpoch - now.millisecondsSinceEpoch) ~/
        (1000 * 60 * 60);
    int minute =
        ((datetime.millisecondsSinceEpoch - now.millisecondsSinceEpoch) ~/
                (1000 * 60)) %
            60;
    int second =
        (((datetime.millisecondsSinceEpoch - now.millisecondsSinceEpoch) /
                    1000) %
                60)
            .toInt();
    countdownDuration = Duration(hours: hour, minutes: minute, seconds: second);
  }

  void reset() {
    if (countDown.value) {
      duration.value = countdownDuration;
    } else {
      duration.value = Duration();
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown.value ? -1 : 1;
    final seconds = duration.value.inSeconds + addSeconds;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      duration.value = Duration(seconds: seconds);
    }
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    timer?.cancel();
  }

  void startChallenge() async {
    bool response =
        await ChallengeDetailRepository().startChallenge(challengeId);
    if (response) {
      isChallenge(response);
      showToast('화이팅✨ 도전을 시작했어요!');
    }
  }

  void stopChallenge(String reason) async {
    bool response =
        await ChallengeDetailRepository().stopChallenge(challengeId, reason);
    if (!response) {
      isChallenge(response);
    }
  }

  void endChallenge() async {
    OverdueDiaryModel overdueDiary =
        await ChallengeDetailRepository().endChallenge(challengeId);
    isChallenge(false);
    BottomNavController.to.challengeInit();
    DiariesController.to.myDiaryInit();
    Navigator.pop(context);
    Get.back();
  }

  void endChallengeAndToWrite() async {
    OverdueDiaryModel overdueDiary =
        await ChallengeDetailRepository().endChallenge(challengeId);
    isChallenge(false);
    BottomNavController.to.challengeInit();
    DiariesController.to.myDiaryInit();
    Navigator.pop(context);
    Get.offAndToNamed('/writeDiary', arguments: {
      'writeType': 'write',
      'overdueDiary': overdueDiary,
      'title': challengeDetailModel.value!.title
    });
  }

  showToast(String text) {
    Widget toast = Container(
      width: Get.width - 48.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: CustomText(
          text: text,
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            bottom: 106.h,
            left: 24.w,
          );
        });
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
}
