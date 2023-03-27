import 'dart:async';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/models/challenge/challenge_model.dart';
import 'package:dangdiarysample/models/challenge/recommend_challenge_model.dart';
import 'package:dangdiarysample/repositories/challenge_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

enum PageName { HOME, DIARY, BROWSE, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();

  final challengeModel = Rxn<ChallengeModel>();
  List<RecommendChallengeModel> recommendList = [];
  List<RecommendChallengeModel> inProgressList = [];

  RxInt pageIndex = 0.obs;
  RxBool isShowBottomModal = true.obs;
  late PageController pageController;
  RxDouble page = 0.0.obs;

  late Duration countdownDuration;
  Rx<Duration> duration = Duration().obs;
  Timer? timer;
  RxBool countDown = true.obs;

  List<String> inProgressChallengeImage = [
    'assets/challenge_sample1.png',
    'assets/challenge_sample2.png',
    'assets/challenge_sample3.png',
  ];
  List<String> inProgressChallengeTitle = [
    '한강공원 술래잡기',
    '강아지 푸딩 요리하기',
    '터그 장난감 만들기',
  ];
  List<String> inProgressChallengeContent = [
    '한강 공원 어디에서든 우리 아이와 술래잡기를 해보세요!',
    '포동포동, 정성스레 만든 강아지용 푸딩을 직접 만들어볼까요?',
    '낑낑 줄다리기를 하다보면 보호자님과 관계가 더욱 가까워 진다고요!',
  ];

  List<String> recommendChallengeImage = [
    'assets/challenge_sample1.png',
    'assets/challenge_sample2.png',
    'assets/challenge_sample3.png',
    'assets/challenge_sample4.png',
    'assets/challenge_sample5.png',
  ];
  List<String> recommendChallengeTitle = [
    '한강공원 술래잡기',
    '강아지 푸딩 요리하기',
    '거실에서 노즈워크',
    '터그 장난감 만들기',
    '물놀이 하기',
  ];
  List<String> recommendChallengeContent = [
    '한강 공원 어디에서든 우리 아이와 술래잡기를 해보세요!',
    '포동포동, 정성스레 만든 강아지용 푸딩을 직접 만들어볼까요?',
    '요즘 아이가 스트레스를 받아하진 않나요? 노즈워크 놀이로 해소하세요!',
    '낑낑 줄다리기를 하다보면 보호자님과 관계가 더욱 가까워 진다고요!',
    '낑낑 줄다리기를 하다보면 보호자님과 관계가 더욱 가까워 진다고요!',
  ];

  @override
  void onInit() async {
    pageController = PageController();
    pageController.addListener(pageChangeListener);
    await challengeInit();
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Future<void> challengeInit() async {
    ChallengeModel challengeModelTemp =
        await ChallengeRepository().getChallengeView();
    challengeModel(challengeModelTemp);

    if (challengeModel.value!.inProgressChallenges.isNotEmpty) {
      for (RecommendChallengeModel inProgressChallengeModel
          in challengeModel.value!.inProgressChallenges) {
        if (inProgressChallengeModel.recommendType == 'daily') {
          setDuration(inProgressChallengeModel.recommendDate);
        } else {
          countdownDuration = const Duration(hours: 0, minutes: 0, seconds: 0);
        }
      }
    } else {
      countdownDuration = const Duration(hours: 0, minutes: 0, seconds: 0);
    }
    reset();
    startTimer();
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

  void pageChangeListener() {
    page(pageController.page);
  }

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
        pageIndex(value);
        break;
      case PageName.DIARY:
        pageIndex(value);
        break;
      case PageName.BROWSE:
        pageIndex(value);
        break;
      case PageName.MYPAGE:
        pageIndex(value);
        break;
    }
  }

  void changeIsShowBottomModal() {
    isShowBottomModal(!isShowBottomModal.value);
  }

  void showExplanationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: '챌린지 추천 방식 설명',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (24 / 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: StaticIcon(
                        IconsPath.quit,
                        size: 24.r,
                        color: Color(0xff202020),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomText(
                  text: '일일 챌린지',
                  color: StaticColor.main,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: (20 / 16),
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text:
                      '일일 챌린지는 매일 오전 9시에 갱신되고 있어요.\n갱신 전까지 하루동안 완료 및 일기쓰기를 하셔야 하며, 챌린지 수락시 \'진행중인 챌린지\'에서 마감 기한을 확인하실 수 있어요.',
                  color: StaticColor.icon,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
                SizedBox(height: 24.h),
                CustomText(
                  text: '일반 챌린지',
                  color: StaticColor.main,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  height: (20 / 16),
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text:
                      '일반 챌린지는 매주 월요일에 갱신되고 있어요.\n달성 마감 기한이 따로 없으니, 마음에 드는 챌린지가 있다면 갱신 전에 미리 받아두길 추천해요!',
                  color: StaticColor.icon,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
