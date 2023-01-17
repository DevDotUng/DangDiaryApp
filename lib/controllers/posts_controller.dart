import 'dart:math';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/random_position_sticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PostsController extends GetxController {
  static PostsController get to => Get.find();
  List<PageController> pageViewControllerList = [];
  List<RxInt> pageViewIndexList = [];

  @override
  void onInit() {
    initPageViews();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void initPageViews() {
    for (int i = 0; i < 4; i++) {
      pageViewControllerList.add(PageController());
      pageViewIndexList.add(0.obs);
      pageViewControllerList[i].addListener(() {
        pageScrollListener(i);
      });
    }
  }

  void pageScrollListener(int index) {
    if (pageViewControllerList[index].page! % 1 < 0.5) {
      pageViewIndexList[index](pageViewControllerList[index].page!.toInt());
    } else {
      pageViewIndexList[index](pageViewControllerList[index].page!.toInt() + 1);
    }
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
              SizedBox(height: 24.h),
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
                        children: [
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.build,
                            size: 18.r,
                            color: Color(0xff202020),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: '이 계정 정보',
                            color: Color(0xff4D4D4D),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            height: (32 / 18),
                          ),
                          Expanded(child: SizedBox()),
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
                  print('일기 수정');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.build,
                            size: 18.r,
                            color: Color(0xff202020),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: '해당 일기 공유하기',
                            color: Color(0xff4D4D4D),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            height: (32 / 18),
                          ),
                          Expanded(child: SizedBox()),
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
                  print('일기 수정');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Row(
                        children: [
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.build,
                            size: 18.r,
                            color: Color(0xff202020),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: '이 챌린지 도전하기',
                            color: Color(0xff4D4D4D),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            height: (32 / 18),
                          ),
                          Expanded(child: SizedBox()),
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
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.restore_from_trash,
                          size: 18.r,
                          color: Color(0xffF02E2E),
                        ),
                        SizedBox(width: 8.w),
                        CustomText(
                          text: '일기를 신고합니다',
                          color: Color(0xffF02E2E),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          height: (32 / 18),
                        ),
                        Expanded(child: SizedBox()),
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
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
}
