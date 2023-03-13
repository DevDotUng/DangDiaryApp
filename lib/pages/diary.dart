import 'dart:math';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/diary_controller.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class Diary extends StatelessWidget {
  Diary({Key? key}) : super(key: key);

  String postContent =
      '나는 평소에 초코가 되게 얌전하고 게으른 줄 알았는데, 오늘 챌린지를 하면서 완전 오해라는 걸 깨달았다... 초코.. 보통이 아닌 댕댕이다... 얼마나 뛰는 걸 좋아하던지, 내가 먼저 지쳐 나가 떨어졌다!😭 그래도 초코가 활기차게 뛰어 노는 걸 보니 앞으로도 종종 이렇게 전력질주 하는 날을 만들어 줘야겠다는 생각이 들었다 :)';

  @override
  Widget build(BuildContext context) {
    Get.put(DiaryController(context: context));
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 32.r,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              title: Obx(
                () => CustomText(
                  text: DiaryController.to.pageIndex.value == 0
                      ? '2022년 12월'
                      : '${DiaryController.to.pageIndex}/4',
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  height: (28 / 20),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: GestureDetector(
                    onTap: () {
                      if (DiaryController.to.pageIndex.value == 0) {
                        DiaryController.to.editDiaryCover(context);
                      } else {
                        DiaryController.to.editDiary(context);
                      }
                    },
                    child: StaticIcon(
                      IconsPath.more_bold,
                      size: 24.r,
                      color: Color(0xff272727),
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              color: Colors.white,
              child: Swiper(
                onIndexChanged: (index) {
                  DiaryController.to.swipeListener(index);
                },
                itemCount: 5,
                layout: SwiperLayout.CUSTOM,
                customLayoutOption:
                    CustomLayoutOption(startIndex: -1, stateCount: 3)
                      ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                      ..addTranslate([
                        Offset(-470.0.w, -40.0.h),
                        Offset(0.0, 0.0),
                        Offset(470.0.w, -40.0.h)
                      ]),
                itemWidth: Get.width - 40.w,
                itemHeight: Get.height * 0.83,
                loop: false,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 4.w,
                            child: Container(
                              width: Get.width - 80.w,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffEAEAEA),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 20.w,
                            child: Container(
                              width: Get.width - 80.w,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 36.w,
                            child: Obx(
                              () => Container(
                                width: Get.width - 80.w,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: DiaryController.to.coverColorList[
                                      DiaryController.to.coverIndex.value],
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Stack(
                                  children: [
                                    ...List.generate(
                                      DiaryController
                                          .to.randomPositionStickerList.length,
                                      (index) => DiaryController
                                          .to.randomPositionStickerList[index],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 96.h,
                            left: 24.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width - 128.w,
                                  child: Obx(
                                    () => CustomText(
                                      text: DiaryController.to.diaryTitle.value,
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      height: (22 / 20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                CustomText(
                                  text: '열아홉 날의 이야기',
                                  color: StaticColor.font_main,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  height: (24 / 14),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    StaticIcon(
                                      IconsPath.like,
                                      size: 16.r,
                                      color: StaticColor.font_main,
                                    ),
                                    SizedBox(width: 10.w),
                                    CustomText(
                                      text: '000',
                                      color: StaticColor.font_main,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: Get.height * 0.41 - 28.h,
                            right: 0,
                            child: Obx(
                              () => Container(
                                width: 153.w,
                                height: 56.h,
                                decoration: BoxDecoration(
                                  color: DiaryController.to.holderColorList[
                                      DiaryController.to.holderIndex.value],
                                  borderRadius: BorderRadius.circular(28.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.15),
                                            blurRadius: 4.r,
                                          ),
                                        ],
                                      ),
                                      child: Text(
                                        '페이지를 넘기세요',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Icon(
                                      Icons.arrow_circle_right_outlined,
                                      size: 24.r,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Stack(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(12.w, 24.h, 24.w, 32.h),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 4.r,
                                ),
                              ],
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/diary_background.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 81.h),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                      _clipHole(),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(child: Container()),
                                          CustomText(
                                            text: '한강공원 술래잡기',
                                            color: Color(0xff222222),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (24 / 16),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                StaticIcon(
                                                  IconsPath.unlock,
                                                  size: 16.r,
                                                  color: StaticColor.icon,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 4.h),
                                      Container(
                                        width: double.infinity,
                                        height: 2.h,
                                        decoration: BoxDecoration(
                                          color: Color(0xffD9D9D9),
                                          borderRadius:
                                              BorderRadius.circular(1.r),
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Row(
                                        children: [
                                          CustomText(
                                            text: '2022년 12월 06일 금요일',
                                            color: Color(0xff6B6B6B),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (20 / 12),
                                          ),
                                          Expanded(child: Container()),
                                          CustomText(
                                            text: '날씨',
                                            color: Color(0xffA6A6A6),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (20 / 12),
                                          ),
                                          SizedBox(width: 4.w),
                                          Icon(
                                            Icons.wb_sunny_outlined,
                                            size: 16.r,
                                            color: Color(0xff6B6B6B),
                                          ),
                                          SizedBox(width: 8.w),
                                          CustomText(
                                            text: '기분',
                                            color: Color(0xffA6A6A6),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (20 / 12),
                                          ),
                                          SizedBox(width: 4.w),
                                          Icon(
                                            Icons.sentiment_very_satisfied,
                                            size: 16.r,
                                            color: Color(0xff6B6B6B),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      SizedBox(
                                        height: 215.h,
                                        child: Stack(
                                          children: [
                                            PageView.builder(
                                              key: PageStorageKey('${index}'),
                                              controller: DiaryController.to
                                                      .pageViewControllerList[
                                                  index - 1],
                                              itemCount: 3,
                                              itemBuilder: (context, jndex) {
                                                return Container(
                                                  width: double.infinity,
                                                  height: 215.h,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/dog${3 - jndex % 2}.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            Positioned(
                                              bottom: 16.h,
                                              left: (Get.width - 120.w) / 2 -
                                                  28.w,
                                              child: SizedBox(
                                                width: 56,
                                                height: 4,
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: 3,
                                                  itemBuilder:
                                                      (context, kndex) {
                                                    return Obx(
                                                      () => Container(
                                                        margin: EdgeInsets.only(
                                                            right: 4.w),
                                                        width: 16.w,
                                                        height: 4.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: DiaryController
                                                                          .to
                                                                          .pageViewIndexList[
                                                                      index -
                                                                          1] ==
                                                                  kndex
                                                              ? StaticColor
                                                                  .main_light
                                                              : Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.r),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              DiaryController.to
                                                  .changeisLike(index - 1);
                                            },
                                            child: Obx(
                                              () => StaticIcon(
                                                IconsPath.like,
                                                size: 24.r,
                                                color: DiaryController
                                                        .to
                                                        .isLikeList[index - 1]
                                                        .value
                                                    ? StaticColor.like
                                                    : Color(0xffD8D8D8),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          CustomText(
                                            text: '3',
                                            color: StaticColor.icon,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            height: (14 / 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h),
                                      Expanded(
                                        child: CustomText(
                                          text: postContent,
                                          color: Color(0xff6B6B6B),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          height: (20 / 14),
                                        ),
                                      ),
                                      SizedBox(height: 24.h),
                                      Container(
                                        height: 32.h,
                                        child: ListView.builder(
                                          key: PageStorageKey('${index}'),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            if (index == 0) {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 4.w),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 6.h,
                                                    horizontal: 16.w),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  border: Border.all(
                                                    color: StaticColor.line2,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    CustomText(
                                                      text: '# ',
                                                      color: StaticColor.main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    CustomText(
                                                      text: '한강공원 술래잡기',
                                                      color: StaticColor.main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return Container(
                                                margin:
                                                    EdgeInsets.only(right: 4.w),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 6.h,
                                                    horizontal: 16.w),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  border: Border.all(
                                                    color: StaticColor.line2,
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    CustomText(
                                                      text: '# ',
                                                      color:
                                                          StaticColor.font_main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                    CustomText(
                                                      text: '식빵궁뎅이',
                                                      color:
                                                          StaticColor.font_main,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 28.w,
                            child: Container(
                              width: 40.w,
                              height: 66.h,
                              decoration: BoxDecoration(
                                color: StaticColor.main_light,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(20.r),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(child: Container()),
                                  Container(
                                    width: 32.w,
                                    height: 32.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16.r),
                                      image: DecorationImage(
                                        image: AssetImage('assets/sticker.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Obx(
            () => IgnorePointer(
              ignoring: !DiaryController.to.isShowEditDiaryColorModal.value,
              child: AnimatedOpacity(
                opacity:
                    DiaryController.to.isShowEditDiaryColorModal.value ? 1 : 0,
                duration: Duration(milliseconds: 200),
                child: GestureDetector(
                  onTap: () {
                    DiaryController.to.changeIsShowEditDiaryColorModal(false);
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.black.withOpacity(0.45),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Get.height - 727.h,
            left: Get.width / 2 - 100.w,
            child: Obx(
              () => IgnorePointer(
                ignoring: !DiaryController.to.isShowEditDiaryColorModal.value,
                child: AnimatedOpacity(
                  opacity: DiaryController.to.isShowEditDiaryColorModal.value
                      ? 1
                      : 0,
                  duration: Duration(milliseconds: 200),
                  child: SizedBox(
                    width: 200.w,
                    height: 245.h,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 20.w,
                          child: Container(
                            width: 175.w,
                            height: 245.h,
                            decoration: BoxDecoration(
                              color: Color(0xffEAEAEA),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 10.w,
                          child: Container(
                            width: 175.w,
                            height: 245.h,
                            decoration: BoxDecoration(
                              color: Color(0xffD9D9D9),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            width: 175.w,
                            height: 245.h,
                            decoration: BoxDecoration(
                              color: DiaryController.to.coverColorList[
                                  DiaryController.to.coverTempIndex.value],
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 107.5.h,
                          right: 0.w,
                          child: Obx(
                            () => Container(
                              width: 70.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: DiaryController.to.holderColorList[
                                    DiaryController.to.holderTempIndex.value],
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              bottom: DiaryController.to.isShowEditDiaryColorModal.value
                  ? 0
                  : -410.h,
              left: 0,
              right: 0,
              duration: Duration(milliseconds: 200),
              child: Container(
                width: double.infinity,
                height: 410.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: Column(
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
                    SizedBox(height: 24.h),
                    CustomText(
                      text: '표지 색상을 선택해주세요',
                      color: Color(0xff4D4D4D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      height: (32 / 18),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 38.w,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: DiaryController.to.coverColorList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => DiaryController.to.coverTempIndex.value ==
                                    index
                                ? Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    width: 38.w,
                                    height: 38.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(19.r),
                                      border: Border.all(
                                        color: DiaryController
                                            .to.coverColorList[index],
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 32.w,
                                        height: 32.w,
                                        decoration: BoxDecoration(
                                          color: DiaryController
                                              .to.coverColorList[index],
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 24.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      DiaryController.to
                                          .changeCoverIndex(index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 3.h, horizontal: 8.w),
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        color: DiaryController
                                            .to.coverColorList[index],
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      width: double.infinity,
                      height: 1.h,
                      color: Color(0xffF5F5F5),
                    ),
                    SizedBox(height: 24.h),
                    CustomText(
                      text: '홀더 색상을 선택해주세요',
                      color: Color(0xff4D4D4D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      height: (32 / 18),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      height: 38.w,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        scrollDirection: Axis.horizontal,
                        itemCount: DiaryController.to.holderColorList.length,
                        itemBuilder: (context, index) {
                          return Obx(
                            () => DiaryController.to.holderTempIndex.value ==
                                    index
                                ? Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    width: 38.w,
                                    height: 38.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(19.r),
                                      border: Border.all(
                                        color: DiaryController
                                            .to.holderColorList[index],
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 32.w,
                                        height: 32.w,
                                        decoration: BoxDecoration(
                                          color: DiaryController
                                              .to.holderColorList[index],
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 24.r,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      DiaryController.to
                                          .changeHolderIndex(index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 3.h, horizontal: 8.w),
                                      width: 32.w,
                                      height: 32.w,
                                      decoration: BoxDecoration(
                                        color: DiaryController
                                            .to.holderColorList[index],
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      width: double.infinity,
                      height: 1.h,
                      color: Color(0xffF5F5F5),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        SizedBox(width: 24.w),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              DiaryController.to.changeCoverIndex(10);
                              DiaryController.to.changeHolderIndex(10);
                            },
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0.r),
                                border: Border.all(
                                  color: Color(0xffA6A6A6),
                                ),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: '색상 초기화',
                                  color: Color(0xffA6A6A6),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              DiaryController.to
                                  .changeIsShowEditDiaryColorModal(false);
                              DiaryController.to.applyColors();
                              DiaryController.to.showToast(
                                  Icons.check, '다이어리 색상 편집이 완료되었어요!');
                            },
                            child: Container(
                              height: 48.h,
                              decoration: BoxDecoration(
                                color: StaticColor.main,
                                borderRadius: BorderRadius.circular(10.0.r),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: '저장할게요',
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 24.w),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _clipHole() {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 1.2.r,
            spreadRadius: -1.2.r,
          ),
        ],
      ),
    );
  }
}
