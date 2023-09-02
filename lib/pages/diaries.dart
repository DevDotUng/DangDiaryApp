import 'dart:ui';

import 'package:dangdiarysample/components/cover_color.dart';
import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/controllers/diaries_controller.dart';
import 'package:dangdiarysample/skeletons/home_skeleton.dart';
import 'package:dangdiarysample/static/color.dart';
import 'package:dangdiarysample/static/icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Diaries extends StatelessWidget {
  const Diaries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DiariesController());
    return Obx(
      () => DiariesController.to.myDiariesModel.value == null
          ? HomeSkeleton()
          : _diariesView(context),
    );
  }

  Widget _diariesView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: CustomText(
          text: '일기장',
          color: Colors.black,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          height: (28 / 20),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/searchDiary');
              },
              child: StaticIcon(
                IconsPath.search_bold,
                size: 24.r,
                color: Color(0xff202020),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            ListView(
              controller: DiariesController.to.scrollController,
              children: [
                SizedBox(height: 16.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  height: 96.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: StaticColor.font_main,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            height: (32 / 20),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    '${DiariesController.to.myDiariesModel.value?.dogName}와 일기를 쓴 지\n'),
                            TextSpan(
                              text:
                                  '${DiariesController.to.myDiariesModel.value?.date}일',
                              style: TextStyle(
                                color: StaticColor.main,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                height: (32 / 20),
                              ),
                            ),
                            TextSpan(text: '이 되었고\n'),
                            ...DiariesController.to.myDiariesModel.value
                                        ?.numberOfDiary ==
                                    0
                                ? [TextSpan(text: '추억을 시작하려 해요!')]
                                : [
                                    TextSpan(
                                      text:
                                          '${DiariesController.to.myDiariesModel.value?.numberOfDiary}장',
                                      style: TextStyle(
                                        color: StaticColor.main,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        height: (32 / 20),
                                      ),
                                    ),
                                    TextSpan(text: '의 일기를 썼어요'),
                                  ],
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/sticker');
                        },
                        child: Container(
                          width: 89.w,
                          height: 82.h,
                          decoration: BoxDecoration(
                            color: DiariesController.to.myDiariesModel.value
                                        ?.numberOfDiary ==
                                    0
                                ? Color(0xffD9D9D9)
                                : StaticColor.main_light,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 7.h,
                                left: 0,
                                right: 0,
                                child: Container(
                                  width: 89.w,
                                  height: 75.w,
                                  decoration: BoxDecoration(
                                    color: DiariesController.to.myDiariesModel
                                                .value?.numberOfDiary ==
                                            0
                                        ? Color(0xffECECEC)
                                        : StaticColor.main_light_light,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: '칭찬 스티커',
                                        color: StaticColor.font_main,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        height: (32 / 12),
                                      ),
                                      CustomText(
                                        text:
                                            '${DiariesController.to.myDiariesModel.value?.numberOfSticker == 0 ? '00' : DiariesController.to.myDiariesModel.value?.numberOfSticker}장',
                                        color: StaticColor.font_main,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -3.h,
                                left: 34.5.w,
                                child: Container(
                                  width: 20.w,
                                  height: 20.w,
                                  decoration: BoxDecoration(
                                    color: DiariesController.to.myDiariesModel
                                                .value?.numberOfDiary ==
                                            0
                                        ? Color(0xffD9D9D9)
                                        : StaticColor.main_light,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 8.h,
                  color: Color(0xffF5F5F5),
                ),
                SizedBox(height: 16.h),
                _diariesTabBar(),
                Obx(
                  () => DiariesController
                              .to.myDiariesModel.value?.diaries.length ==
                          0
                      ? Center(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 63.h),
                                width: 160.w,
                                height: 160.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/illusts/no_breed.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              CustomText(
                                text: '앗... 일기를 아직 안 쓰셨군요',
                                color: StaticColor.font_main,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                height: (32 / 16),
                              ),
                              SizedBox(height: 8.h),
                              CustomText(
                                text: '챌린지를 하고 일기를 작성해 보세요!',
                                color: StaticColor.icon,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: (20 / 14),
                              ),
                            ],
                          ),
                        )
                      : IndexedStack(
                          index: DiariesController.to.tabBarIndex.value,
                          children: [
                            _monthlyDiaries(),
                            _dailyDiaries(),
                          ],
                        ),
                ),
              ],
            ),
            Positioned(
              child: Obx(
                () => DiariesController.to.isSliver.value
                    ? _diariesTabBar()
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _diariesTabBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      width: double.infinity,
      height: 38.h,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  DiariesController.to.changeTabBarIndex(0);
                },
                child: SizedBox(
                  width: 40.w,
                  child: Center(
                    child: Text(
                      '월별',
                      style: TextStyle(
                        color: Color(0xff545454),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: (20 / 14),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  DiariesController.to.changeTabBarIndex(1);
                },
                child: SizedBox(
                  width: 40.w,
                  child: Center(
                    child: Text(
                      '일별',
                      style: TextStyle(
                        color: Color(0xff545454),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        height: (20 / 14),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            height: 2.h,
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              borderRadius: BorderRadius.circular(1.r),
            ),
            child: Stack(
              children: [
                Obx(
                  () => AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    top: 0,
                    bottom: 0,
                    left: DiariesController.to
                        .getTabBarPosition(
                            DiariesController.to.tabBarIndex.value)
                        .w,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: 40.w,
                      height: 2.h,
                      decoration: BoxDecoration(
                        color: StaticColor.main,
                        borderRadius: BorderRadius.circular(1.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _monthlyDiaries() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 20.w, 24.h),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 11.w,
          mainAxisSpacing: 16.h,
          mainAxisExtent: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
        ),
        itemCount: DiariesController.to.myDiariesModel.value?.diaries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/diary', arguments: {
                'coverId': DiariesController
                    .to.myDiariesModel.value?.diaries[index].coverId
              });
            },
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 16.w,
                  child: Container(
                    width: (Get.width - 55.w) / 2 - 20.w,
                    height: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
                    decoration: BoxDecoration(
                      color: Color(0xffEAEAEA),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 8.w,
                  child: Container(
                    width: (Get.width - 55.w) / 2 - 20.w,
                    height: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
                    decoration: BoxDecoration(
                      color: StaticColor.line2,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
                  width: (Get.width - 55.w) / 2 - 20.w,
                  height: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
                  decoration: BoxDecoration(
                    color: CoverColor().getCoverColor(DiariesController
                        .to.myDiariesModel.value?.diaries[index].coverColor),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                            '${DiariesController.to.myDiariesModel.value?.diaries[index].date}',
                        color: StaticColor.font_main,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        height: (20 / 12),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: 90.w,
                        child: CustomText(
                          text: DiariesController.to.myDiariesModel.value
                                      ?.diaries[index].coverTitle ==
                                  null
                              ? '${DiariesController.to.myDiariesModel.value?.dogName}와의 추억'
                              : '${DiariesController.to.myDiariesModel.value?.diaries[index].coverTitle}',
                          color: Color(0xff222222),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          height: (20 / 14),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: ((Get.width - 55.w) / 2 - 20.w) * 1.35 / 2 - 12.h,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    height: 24.h,
                    decoration: BoxDecoration(
                      color: CoverColor().getHolderColor(DiariesController
                          .to.myDiariesModel.value?.diaries[index].holderColor),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StaticIcon(
                          IconsPath.like,
                          size: 16.r,
                          color: Color(0xff272727),
                        ),
                        SizedBox(width: 4.w),
                        Container(
                          constraints: BoxConstraints(minWidth: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${DiariesController.to.myDiariesModel.value?.diaries[index].numberOfLike}',
                                style: TextStyle(
                                  color: StaticColor.font_main,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _dailyDiaries() {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 24.h, 20.w, 24.h),
      child: SizedBox(
        height: DiariesController.to.tabBarIndex.value == 1 ? null : 0,
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 16.h,
            mainAxisExtent: ((Get.width - 55.w) / 2 - 20.w) * 1.35,
          ),
          children: DiariesController.to.dailyDiaryWidgetList,
        ),
      ),
    );
  }
}
