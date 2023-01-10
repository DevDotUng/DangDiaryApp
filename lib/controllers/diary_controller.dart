import 'dart:math';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/random_position_sticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  static DiaryController get to => Get.find();
  RxList randomPositionStickerList = [].obs;
  RxInt pageIndex = 0.obs;

  @override
  void onInit() {
    setRandomPosition();
    super.onInit();
  }

  void swipeListener(int index) {
    pageIndex(index);
  }

  void setRandomPosition() {
    for (int i = 0; i < 10; i++) {
      int shape = Random().nextInt(2);
      int index = Random().nextInt(5) + 1;
      double size = 56.w + 15.w * index;
      double degrees = Random().nextDouble() * 360;
      double radians = degrees * pi / 180;
      double top;
      double left;
      if (shape == 0) {
        top = Random().nextDouble() *
                (Get.height * 0.83 - 16.h - getDiagonalLength(size) * 1.2) +
            8.h +
            getDiagonalLength(size) * 0.2;
        left = Random().nextDouble() *
                (Get.width - 96.w - getDiagonalLength(size)) +
            8.w;
      } else {
        top = Random().nextDouble() *
                (Get.height * 0.83 - 16.h - getDiagonalLength(size) * 1.2) +
            8.h +
            getDiagonalLength(size) * 0.2;
        left = Random().nextDouble() *
                (Get.width - 96.w - getDiagonalLength(size)) +
            8.w;
      }
      if (shape == 0) {
        randomPositionStickerList.add(
          RandomPositionSticker(
            shape: 'rectangle',
            size: size,
            radians: radians,
            top: top,
            left: left,
          ),
        );
      } else {
        randomPositionStickerList.add(
          RandomPositionSticker(
            shape: 'circle',
            size: size,
            radians: radians,
            top: top,
            left: left,
          ),
        );
      }
    }
  }

  double getDiagonalLength(double size) {
    return sqrt(size * size + (size * 0.7) * (size * 0.7));
  }

  void editDiary(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      builder: (BuildContext buildContext) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  CustomText(
                    text: '편집하기',
                    color: Color(0xff222222),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    height: (32 / 20),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.clear,
                              size: 24.r,
                              color: Color(0xff202020),
                            ),
                          ),
                          SizedBox(width: 24.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
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
                            text: '일기를 수정할래요',
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
                  showDeleteDiaryDialog(context);
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
                            Icons.restore_from_trash,
                            size: 18.r,
                            color: Color(0xffF02E2E),
                          ),
                          SizedBox(width: 8.w),
                          CustomText(
                            text: '일기를 삭제할래요',
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

  void showDeleteDiaryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.all(24.0.r),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 40.r, horizontal: 24.w),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.restore_from_trash,
                      size: 24.r,
                      color: Color(0xff202020),
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '일기를 삭제할까요?',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.clear,
                        size: 24.r,
                        color: Color(0xff202020),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: '한번 삭제된 일기의 내용과 사진들은 다시 복구할 수 없습니다. 정말로 일기장을 삭제할건가요?',
                  color: Color(0xff7D7D7D),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  height: (20 / 14),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 120.h,
                  color: Color(0xffD9D9D9),
                ),
                SizedBox(height: 24.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0.r),
                      border: Border.all(
                        color: Color(0xffF02E2E),
                      ),
                    ),
                    child: Center(
                      child: CustomText(
                        text: '삭제할래요',
                        color: Color(0xffF02E2E),
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
}
