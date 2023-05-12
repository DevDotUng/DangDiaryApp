import 'dart:math';
import 'dart:ui';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/reactive_device.dart';
import 'package:dangdiarysample/controllers/bottom_nav_controller.dart';
import 'package:dangdiarysample/pages/diaries.dart';
import 'package:dangdiarysample/pages/home.dart';
import 'package:dangdiarysample/pages/my_page.dart';
import 'package:dangdiarysample/pages/browse.dart';
import 'package:dangdiarysample/repositories/public_repository.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    return Obx(
      () => BottomNavController.to.challengeModel.value == null
          ? HomeSkeleton()
          : _appView(context),
    );
  }

  Widget _appView(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !(await navigatorKeys[BottomNavController.to.pageIndex]!
            .currentState!
            .maybePop());
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              IndexedStack(
                index: BottomNavController.to.pageIndex.value,
                children: [
                  Navigator(
                    key: navigatorKeys[0],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => Home(),
                      );
                    },
                  ),
                  Navigator(
                    key: navigatorKeys[1],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => Diaries(),
                      );
                    },
                  ),
                  Navigator(
                    key: navigatorKeys[2],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => Browse(),
                      );
                    },
                  ),
                  Navigator(
                    key: navigatorKeys[3],
                    onGenerateRoute: (routeSettings) {
                      return MaterialPageRoute(
                        builder: (context) => MyPage(),
                      );
                    },
                  ),
                ],
              ),
              IgnorePointer(
                ignoring: BottomNavController.to.isShowBottomModal.value,
                child: AnimatedOpacity(
                  opacity:
                      BottomNavController.to.isShowBottomModal.value ? 0 : 1,
                  duration: Duration(milliseconds: 600),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: double.infinity,
                      height: Get.height,
                      color: Colors.white.withOpacity(0.5),
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: 38.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: BottomNavController.to.page.value < 0.5
                                      ? StaticColor.main
                                      : Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: 38.w,
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: BottomNavController.to.page.value > 0.5
                                      ? StaticColor.main
                                      : Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(2.r),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Expanded(child: Container()),
                              CustomText(
                                text: BottomNavController.to.page.value < 0.5
                                    ? '진행중인 챌린지'
                                    : '추천 챌린지',
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                height: (28 / 20),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BottomNavController.to.page.value < 0.5
                                        ? Container()
                                        : Padding(
                                            padding:
                                                EdgeInsets.only(right: 24.w),
                                            child: GestureDetector(
                                              onTap: () {
                                                BottomNavController.to
                                                    .showExplanationDialog(
                                                        context);
                                              },
                                              child: StaticIcon(
                                                IconsPath.caution,
                                                size: 24.r,
                                                color: StaticColor.link,
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.85 + 16.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: BottomNavController.to.isShowBottomModal.value
                    ? -Get.height
                    : 0,
                left: 0,
                right: 0,
                duration: BottomNavController.to.isShowBottomModal.value
                    ? Duration(milliseconds: 1500)
                    : Duration(milliseconds: 600),
                curve: Cubic(0.175, 0.885, 0.32, 1.07),
                child: Container(
                  width: double.infinity,
                  height: Get.height * 0.85,
                  child: PageView(
                    controller: BottomNavController.to.pageController,
                    children: [
                      ListView(
                        children: [
                          ...List.generate(
                            BottomNavController.to.challengeModel.value!
                                .overdueChallenges.length,
                            (index) => Padding(
                              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/challengeDetail', arguments: {
                                    'challengeId': BottomNavController
                                        .to
                                        .challengeModel
                                        .value!
                                        .overdueChallenges[index]
                                        .challengeId
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 16.w),
                                  width: double.infinity,
                                  height: 112.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                PublicRepository()
                                                    .getChallengeImageUrl(
                                                        BottomNavController
                                                            .to
                                                            .challengeModel
                                                            .value!
                                                            .overdueChallenges[
                                                                index]
                                                            .image)),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width - 176.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: CustomText(
                                                    text: BottomNavController
                                                        .to
                                                        .challengeModel
                                                        .value!
                                                        .overdueChallenges[
                                                            index]
                                                        .title,
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: (24 / 16),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                BottomNavController
                                                            .to
                                                            .challengeModel
                                                            .value!
                                                            .overdueChallenges[
                                                                index]
                                                            .recommendType ==
                                                        'daily'
                                                    ? Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.w),
                                                        height: 22.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              StaticColor.main,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      11.r),
                                                        ),
                                                        child: Center(
                                                          child: Obx(
                                                            () => Text(
                                                              '${twoDigits(BottomNavController.to.duration.value.inHours)}:${twoDigits(BottomNavController.to.duration.value.inMinutes.remainder(60))}:${twoDigits(BottomNavController.to.duration.value.inSeconds.remainder(60))} 남음',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.w),
                                                        height: 22.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: StaticColor
                                                              .sub_deeper,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      11.r),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '밀린 일기',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width - 176.w,
                                            child: CustomText(
                                              text: BottomNavController
                                                  .to
                                                  .challengeModel
                                                  .value!
                                                  .overdueChallenges[index]
                                                  .content,
                                              color: Color(0xff7D7D7D),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: (20 / 14),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ...List.generate(
                            BottomNavController.to.challengeModel.value!
                                .inProgressChallenges.length,
                            (index) => Padding(
                              padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed('/challengeDetail', arguments: {
                                    'challengeId': BottomNavController
                                        .to
                                        .challengeModel
                                        .value!
                                        .inProgressChallenges[index]
                                        .challengeId
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 16.w),
                                  width: double.infinity,
                                  height: 112.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 80.w,
                                        height: 80.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                            image: NetworkImage(PublicRepository()
                                                .getChallengeImageUrl(
                                                    BottomNavController
                                                        .to
                                                        .challengeModel
                                                        .value!
                                                        .inProgressChallenges[
                                                            index]
                                                        .image)),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 16.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width - 176.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: CustomText(
                                                    text: BottomNavController
                                                        .to
                                                        .challengeModel
                                                        .value!
                                                        .inProgressChallenges[
                                                            index]
                                                        .title,
                                                    color: Colors.black,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w400,
                                                    height: (24 / 16),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(width: 4.w),
                                                BottomNavController
                                                            .to
                                                            .challengeModel
                                                            .value!
                                                            .inProgressChallenges[
                                                                index]
                                                            .recommendType ==
                                                        'daily'
                                                    ? Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    8.w),
                                                        height: 22.h,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              StaticColor.main,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      11.r),
                                                        ),
                                                        child: Center(
                                                          child: Obx(
                                                            () => Text(
                                                              '${twoDigits(BottomNavController.to.duration.value.inHours)}:${twoDigits(BottomNavController.to.duration.value.inMinutes.remainder(60))}:${twoDigits(BottomNavController.to.duration.value.inSeconds.remainder(60))} 남음',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width - 176.w,
                                            child: CustomText(
                                              text: BottomNavController
                                                  .to
                                                  .challengeModel
                                                  .value!
                                                  .inProgressChallenges[index]
                                                  .content,
                                              color: Color(0xff7D7D7D),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              height: (20 / 14),
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: BottomNavController.to.challengeModel.value!
                            .recommendChallenges.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/challengeDetail', arguments: {
                                  'challengeId': BottomNavController
                                      .to
                                      .challengeModel
                                      .value!
                                      .recommendChallenges[index]
                                      .challengeId
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                                width: double.infinity,
                                height: 112.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 80.w,
                                      height: 80.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                          image: NetworkImage(PublicRepository()
                                              .getChallengeImageUrl(
                                                  BottomNavController
                                                      .to
                                                      .challengeModel
                                                      .value!
                                                      .recommendChallenges[
                                                          index]
                                                      .image)),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width - 176.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: CustomText(
                                                  text: BottomNavController
                                                      .to
                                                      .challengeModel
                                                      .value!
                                                      .recommendChallenges[
                                                          index]
                                                      .title,
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  height: (24 / 16),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              BottomNavController
                                                          .to
                                                          .challengeModel
                                                          .value!
                                                          .recommendChallenges[
                                                              index]
                                                          .recommendType ==
                                                      'daily'
                                                  ? Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8.w),
                                                      height: 22.h,
                                                      decoration: BoxDecoration(
                                                        color: StaticColor.main,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(11.r),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '일일 챌린지',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width - 176.w,
                                          child: CustomText(
                                            text: BottomNavController
                                                .to
                                                .challengeModel
                                                .value!
                                                .recommendChallenges[index]
                                                .content,
                                            color: Color(0xff7D7D7D),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            height: (20 / 14),
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: _bottomNavBar(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _a() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: BottomNavController
          .to.challengeModel.value!.inProgressChallenges.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
          child: GestureDetector(
            onTap: () {
              Get.toNamed('/challengeDetail', arguments: {
                'challengeId': BottomNavController.to.challengeModel.value!
                    .inProgressChallenges[index].challengeId
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              width: double.infinity,
              height: 112.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: NetworkImage(PublicRepository()
                            .getChallengeImageUrl(BottomNavController
                                .to
                                .challengeModel
                                .value!
                                .inProgressChallenges[index]
                                .image)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - 176.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: CustomText(
                                text: BottomNavController.to.challengeModel
                                    .value!.inProgressChallenges[index].title,
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                height: (24 / 16),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            BottomNavController
                                        .to
                                        .challengeModel
                                        .value!
                                        .inProgressChallenges[index]
                                        .recommendType ==
                                    'daily'
                                ? Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.w),
                                    height: 22.h,
                                    decoration: BoxDecoration(
                                      color: StaticColor.main,
                                      borderRadius: BorderRadius.circular(11.r),
                                    ),
                                    child: Center(
                                      child: Obx(
                                        () => Text(
                                          '${twoDigits(BottomNavController.to.duration.value.inHours)}:${twoDigits(BottomNavController.to.duration.value.inMinutes.remainder(60))}:${twoDigits(BottomNavController.to.duration.value.inSeconds.remainder(60))} 남음',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width - 176.w,
                        child: CustomText(
                          text: BottomNavController.to.challengeModel.value!
                              .inProgressChallenges[index].content,
                          color: Color(0xff7D7D7D),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          height: (20 / 14),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _bottomNavBack(int index) async {
    if (BottomNavController.to.pageIndex.value == index) {
      navigatorKeys[index]!.currentState?.popUntil((route) => route.isFirst);
    }
  }

  Widget _bottomNavBar(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ReactiveDevice().hasHomeIndicator() ? 171.h : 137.h,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  width: double.infinity,
                  height: ReactiveDevice().hasHomeIndicator() ? 110.h : 76.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30.r)),
                    border: Border.all(color: Color(0xffEAEAEA)),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: ReactiveDevice().hasHomeIndicator() ? 30.h : -4.h,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 80.h,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _bottomNavigationBarItem(
                            IconsPath.home_bold,
                            '홈',
                            0,
                          ),
                          _bottomNavigationBarItem(
                            IconsPath.diary_bold,
                            '일기장',
                            1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(width: 64.w),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _bottomNavigationBarItem(
                            IconsPath.browse,
                            '둘러보기',
                            2,
                          ),
                          _bottomNavigationBarItem(
                            IconsPath.my_bold,
                            'MY',
                            3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 43.h,
            left: Get.width * 0.5 - 32.w,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    BottomNavController.to.changeIsShowBottomModal();
                  },
                  child: Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      color: StaticColor.white,
                      borderRadius: BorderRadius.circular(32.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 10.r,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 64.w,
                            height: 64.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32.r),
                              border: Border.all(
                                color: StaticColor.main,
                                width: 2.r,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: BottomNavController.to.isShowBottomModal.value
                              ? 14.h
                              : 16.h,
                          left: BottomNavController.to.isShowBottomModal.value
                              ? 14.h
                              : 16.h,
                          child: BottomNavController.to.isShowBottomModal.value
                              ? StaticIcon(IconsPath.challenge_bold, size: 36.w)
                              : StaticIcon(IconsPath.quit_bold,
                                  size: 32.w, color: StaticColor.main),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 16.w,
                            height: 16.w,
                            decoration: BoxDecoration(
                              color: StaticColor.main,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '챌린지',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBarItem(String iconsPath, String label, int index) {
    return GestureDetector(
      onTap: () {
        _bottomNavBack(index);
        BottomNavController.to.changeBottomNav(index);
        BottomNavController.to.isShowBottomModal(true);
      },
      child: Column(
        children: [
          SizedBox(height: 16.h),
          StaticIcon(
            iconsPath,
            size: 24.r,
            color: BottomNavController.to.pageIndex == index
                ? StaticColor.main
                : StaticColor.icon,
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: BottomNavController.to.pageIndex == index
                      ? Colors.orangeAccent
                      : Color(0xffA6A6A6),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
