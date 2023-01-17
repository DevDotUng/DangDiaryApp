import 'dart:math';

import 'package:dangdiarysample/components/custom_text.dart';
import 'package:dangdiarysample/components/random_position_sticker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  static DiaryController get to => Get.find();
  late BuildContext context;
  DiaryController({required this.context});

  late FToast fToast;
  RxList randomPositionStickerList = [].obs;
  RxInt pageIndex = 0.obs;
  List<PageController> pageViewControllerList = [];
  List<RxInt> pageViewIndexList = [];
  RxBool isShowEditDiaryColorModal = false.obs;
  List coverColorList = [
    Color(0xffFF9686),
    Color(0xffFFB393),
    Color(0xffFFCDB8),
    Color(0xffFFA251),
    Color(0xffFFD84B),
    Color(0xffFFE092),
    Color(0xffB0DBAB),
    Color(0xffD5E5AB),
    Color(0xffECF3AE),
    Color(0xff9CE1CF),
    Color(0xffB6CAFF),
    Color(0xffD3E0FF),
    Color(0xffCF8EF5),
    Color(0xffE3B2FF),
    Color(0xffEFD4FF),
    Color(0xffFBE7ED),
  ];
  List holderColorList = [
    Color(0xffEF7260),
    Color(0xffFB956B),
    Color(0xffFFB697),
    Color(0xffF38928),
    Color(0xffFFBA34),
    Color(0xffFFD464),
    Color(0xff77D380),
    Color(0xffBEDE69),
    Color(0xffDDED53),
    Color(0xff3AD4AC),
    Color(0xff8BACFF),
    Color(0xffB5C9FF),
    Color(0xffA752DA),
    Color(0xffC77EF2),
    Color(0xffDEA9FF),
    Color(0xffFFB7CC),
  ];
  RxInt coverIndex = 10.obs;
  RxInt holderIndex = 10.obs;
  RxInt coverTempIndex = 10.obs;
  RxInt holderTempIndex = 10.obs;
  RxString diaryTitle = '초코와 겨울'.obs;
  late TextEditingController titleTextEditingController;

  @override
  void onInit() {
    setRandomPosition();
    fToast = FToast();
    fToast.init(context);
    titleTextEditingController = TextEditingController();
    initPageViews();
    super.onInit();
  }

  @override
  void dispose() {
    titleTextEditingController.dispose();
    super.dispose();
  }

  void swipeListener(int index) {
    pageIndex(index);
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

  void changeCoverIndex(int index) {
    coverTempIndex(index);
  }

  void changeHolderIndex(int index) {
    holderTempIndex(index);
  }

  void changeDiaryTitle(String title) {
    diaryTitle(title);
  }

  void applyColors() {
    coverIndex(coverTempIndex.value);
    holderIndex(holderTempIndex.value);
  }

  showToast(IconData? icon, String text) {
    double _statusBarHeight = MediaQuery.of(context).viewPadding.top;
    Widget toast = Container(
      width: Get.width - 48.w,
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Color(0xff7D7D7D),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24.r,
            color: Colors.white,
          ),
          SizedBox(width: 4.w),
          CustomText(
            text: text,
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );

    fToast.showToast(
        child: toast,
        toastDuration: Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            child: child,
            top: _statusBarHeight + 8.h,
            left: 24.w,
          );
        });
  }

  void setRandomPosition() {
    for (int i = 0; i < 10; i++) {
      int shape = Random().nextInt(2);
      int index = Random().nextInt(5) + 1;
      double size = 56.w + 15.w * index;
      double degrees = Random().nextDouble() * 360;
      double radians = degrees * pi / 180;
      double top = 8.h;
      double left;
      if (shape == 0) {
        do {
          top = Random().nextDouble() *
                  (Get.height * 0.83 - 16.h - getDiagonalLength(size) * 1.2) +
              8.h +
              getDiagonalLength(size) * 0.2;
        } while (
            !(top < 64.h || (top > 210.h && top < Get.height * 0.83 - 16.h)));
        left = Random().nextDouble() *
                (Get.width - 96.w - getDiagonalLength(size)) +
            8.w;
      } else {
        do {
          top = Random().nextDouble() *
                  (Get.height * 0.83 - 16.h - getDiagonalLength(size) * 1.2) +
              8.h +
              getDiagonalLength(size) * 0.2;
        } while (
            !(top < 64.h || (top > 210.h && top < Get.height * 0.83 - 16.h)));
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

  void changeIsShowEditDiaryColorModal(bool isShow) {
    isShowEditDiaryColorModal(isShow);
  }

  void editDiaryCover(BuildContext context) {
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
                  Navigator.pop(context);
                  showToast(Icons.lock, '모든 일기가 공개 되었어요!');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '모든 일기 공개하기',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
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
                  showEditTitleDialog(context);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '다이어리 제목 편집',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
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
                  changeIsShowEditDiaryColorModal(true);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '다이어리 색상 편집',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
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
                    CustomText(
                      text: '모든 일기 삭제하기',
                      color: Color(0xffF02E2E),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      height: (32 / 18),
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
                  print('일기 공개');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '이 일기 비공개하기',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
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
                  print('일기 공유');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '이 일기 공유하기',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
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
                      CustomText(
                        text: '일기를 수정할래요',
                        color: Color(0xff4D4D4D),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
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
                  print('일기 삭제');
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      CustomText(
                        text: '일기를 삭제할래요',
                        color: Color(0xffF02E2E),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        height: (32 / 18),
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

  void showEditTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 24.0.w),
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
                      Icons.edit,
                      size: 24.r,
                      color: Color(0xff202020),
                    ),
                    SizedBox(width: 8.w),
                    CustomText(
                      text: '다이어리 제목을 입력해주세요.',
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                TextField(
                  controller: titleTextEditingController,
                  maxLength: 14,
                  cursorColor: Colors.black,
                  cursorHeight: 24.h,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    height: (24 / 14).h,
                  ),
                  decoration: InputDecoration(
                    hintText: '초코의 다이어리6 (최대 14글자)',
                    hintStyle: TextStyle(
                      color: Color(0xffA6A6A6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      height: (24 / 14).h,
                    ),
                    counter: Container(),
                    contentPadding: EdgeInsets.only(top: 8.h),
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 8.w,
                      maxHeight: 7.h,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
                              text: '취소할게요',
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
                          Navigator.pop(context);
                          changeDiaryTitle(titleTextEditingController.text);
                        },
                        child: Container(
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: Color(0xff7D7D7D),
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
                  ],
                ),
              ],
            ),
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
