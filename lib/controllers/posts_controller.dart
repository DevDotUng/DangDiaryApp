import 'dart:math';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/random_position_sticker.dart';
import 'package:dangdiarysample/models/browse/posts_model.dart';
import 'package:dangdiarysample/pages/posts.dart';
import 'package:dangdiarysample/repositories/browse_repository.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PostsController extends GetxController {
  int? browseId;
  String? query;
  String? searchType;
  String? dogName;
  String? nickname;
  PostsController({
    required this.browseId,
    required this.query,
    required this.searchType,
    required this.dogName,
    required this.nickname,
  });
  RxList<PostsModel> postsModels = <PostsModel>[].obs;
  final challengeId = Rxn<int>();

  List<PageController> pageViewControllerList = [];
  List<RxInt> pageViewIndexList = [];

  @override
  void onInit() {
    postsInit();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> postsInit() async {
    List<PostsModel> postsModelsTemp;
    if (browseId == null) {
      postsModelsTemp = await BrowseRepository()
          .getPostsSearchView(query, searchType, dogName, nickname);
    } else {
      postsModelsTemp = await BrowseRepository().getPostsView(browseId!);
    }
    postsModels(postsModelsTemp);
    initPageViews(postsModels.length);

    if (searchType == 'hashTag') {
      int? challengeIdTemp = await BrowseRepository().getIsChallenge(query!);
      challengeId(challengeIdTemp);
    }
  }

  void initPageViews(int length) {
    for (int i = 0; i < length; i++) {
      pageViewControllerList.add(PageController());
    }
  }

  Future<bool> isMyPosts(int userId) async {
    Box homeBox = await Hive.openBox('userInfo');
    int myUserId = homeBox.get('userId');

    return userId == myUserId;
  }

  void searchByHashTag(String hashTag) {
    Get.toNamed('/posts',
        arguments: {'query': hashTag, 'searchType': 'hashTag'},
        preventDuplicates: false);
  }

  void editDiary(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      builder: (BuildContext buildContext) {
        return Container(
          padding: EdgeInsets.only(bottom: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8.h),
              Container(
                width: 48.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () {
                  print('일기 수정');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: '해당 일기 공유하기',
                            color: Color(0xff4D4D4D),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            height: (32 / 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed('/challengeDetail');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: '이 챌린지 도전하기',
                            color: Color(0xff4D4D4D),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            height: (32 / 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              GestureDetector(
                onTap: () {
                  _showReportPostsDialog(context);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: '일기를 신고합니다',
                            color: StaticColor.error,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            height: (32 / 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.h,
                color: Color(0xffF5F5F5),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  List<RxBool> _checkBoxBoolList = [
    true.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
  ];

  void _showReportPostsDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: '정말 그만두시겠어요?',
                      color: StaticColor.font_main,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      height: (24 / 20),
                    ),
                    SizedBox(height: 8.h),
                    CustomText(
                      text: '신고 사유를 설명해 주시면 꼼꼼히 확인 후 신속히 처리하도록 할게요!',
                      color: StaticColor.icon,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (20 / 14),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      width: double.infinity,
                      height: 120.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/illusts/overdue_diary.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    ..._checkBoxList(),
                  ],
                ),
                SizedBox(height: 32.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: StaticColor.main,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: Center(
                      child: CustomText(
                        text: '제출할게요',
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List _checkBoxList() {
    return [
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(0, '학대가 의심돼요.'),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(1, '일기가 챌린지와 무관해요.'),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(2, '상업적 광고가 포함되어 있어요.'),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10.0.h),
        child: _checkBox(3, '불쾌한 내용이 포함되어 있어요.'),
      ),
      _checkBox(4, '불법적인 게시글이에요.(펫 분양/약물 등)'),
    ];
  }

  Widget _checkBox(int index, String content) {
    return GestureDetector(
      onTap: () {
        _checkBoxBoolList[index](!_checkBoxBoolList[index].value);
      },
      child: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _checkBoxBoolList[index].value
                ? Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0.r),
                      border: Border.all(
                        color: StaticColor.link,
                        width: 1.5.w,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          color: StaticColor.main,
                          borderRadius: BorderRadius.circular(6.0.r),
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0.r),
                      border: Border.all(
                        color: StaticColor.line,
                      ),
                    ),
                  ),
            SizedBox(width: 8.w),
            CustomText(
              text: content,
              color: Color(0xff222222),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              height: (20 / 16),
            ),
          ],
        ),
      ),
    );
  }
}
