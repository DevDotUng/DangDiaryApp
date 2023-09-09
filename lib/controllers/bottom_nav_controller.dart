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
import 'package:hive/hive.dart';
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

  late Box homeBox;

  @override
  void onInit() async {
    pageController = PageController();
    pageController.addListener(pageChangeListener);
    await challengeInit();
    homeBox = await Hive.openBox('userInfo');
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

  void changeIsShowBottomModal() async {
    homeBox.put(
        'challengeUpdateTime',
        DateTime.utc(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, DateTime.now().hour, DateTime.now().minute));
    isShowBottomModal(!isShowBottomModal.value);
  }

  bool isShowChallenge() {
    DateTime updateDateTime = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 10);
    DateTime now = DateTime.utc(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour, DateTime.now().minute);
    return homeBox.get('challengeUpdateTime') == null ||
        (homeBox.get('challengeUpdateTime').isBefore(updateDateTime) &&
            now.isAfter(updateDateTime));
  }

  void showExplanationDialog(BuildContext context) {
    showDialog(
      context: context,
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
